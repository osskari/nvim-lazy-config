-- add deps
vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
})

local dap = require("dap")
local dapui = require("dapui")

-- container helpers
local docker = "docker"
-- path to netcoredbg inside the container, override per config with `netcoredbg = "..."`
local default_netcoredbg = vim.g.netcoredbg_container_path or "/opt/netcoredbg/netcoredbg"

-- lists processes via /proc since slim dotnet images ship without `ps`
local ps_script = [[for p in /proc/[0-9]*; do c=$(tr '\0' ' ' < "$p/cmdline" 2>/dev/null); [ -n "$c" ] && echo "${p#/proc/} $c"; done]]

local function system_lines(cmd)
  local res = vim.system(cmd, { text = true }):wait()
  if res.code ~= 0 then
    return nil, vim.trim(res.stderr or "")
  end
  return vim.split(vim.trim(res.stdout), "\n", { trimempty = true })
end

local function pick(items, prompt, format_item, cb)
  if #items == 1 then
    return cb(items[1])
  end
  vim.ui.select(items, { prompt = prompt, format_item = format_item }, cb)
end

local function pick_container(cb)
  local lines, err = system_lines({ docker, "ps", "--format", "{{.Names}}\t{{.Image}}" })
  if not lines or #lines == 0 then
    vim.notify("dap: no running containers " .. (err or ""), vim.log.levels.ERROR)
    return
  end

  local containers = vim.tbl_map(function(line)
    local name, image = unpack(vim.split(line, "\t"))
    return { name = name, image = image }
  end, lines)

  pick(containers, "Container", function(c)
    return c.name .. "  (" .. c.image .. ")"
  end, function(c)
    if c then cb(c.name) end
  end)
end

local function pick_process(container, cb)
  local lines, err = system_lines({ docker, "exec", container, "sh", "-c", ps_script })
  if not lines then
    vim.notify("dap: could not list processes in " .. container .. " " .. (err or ""), vim.log.levels.ERROR)
    return
  end

  local all, dotnet = {}, {}
  for _, line in ipairs(lines) do
    local pid, cmd = line:match("^(%d+) (.*)$")
    if pid and not cmd:find("/proc/", 1, true) and not cmd:find("^tr ") and not cmd:find("netcoredbg", 1, true) then
      local proc = { pid = tonumber(pid), cmd = cmd }
      table.insert(all, proc)
      if cmd:find("dotnet", 1, true) or cmd:find("%.dll") then
        table.insert(dotnet, proc)
      end
    end
  end

  pick(#dotnet > 0 and dotnet or all, "Process in " .. container, function(p)
    return p.pid .. "  " .. p.cmd
  end, function(p)
    if p then cb(p.pid) end
  end)
end

-- netcoredbg injection
-- containers without netcoredbg get a linux build, downloaded once to the cache and `docker cp`'d in
local netcoredbg_version = vim.g.netcoredbg_version or "3.2.0-1092"
local injected_netcoredbg = "/tmp/netcoredbg/netcoredbg"

local function run(cmd, on_exit)
  vim.system(cmd, { text = true }, vim.schedule_wrap(on_exit))
end

local function fail(msg)
  vim.notify("dap: " .. msg, vim.log.levels.ERROR)
end

local function download_netcoredbg(arch, cb)
  local dir = vim.fs.joinpath(vim.fn.stdpath("cache"), "netcoredbg", netcoredbg_version, "linux-" .. arch)
  if vim.uv.fs_stat(vim.fs.joinpath(dir, "netcoredbg", "netcoredbg")) then
    return cb(dir)
  end

  local url = ("https://github.com/Samsung/netcoredbg/releases/download/%s/netcoredbg-linux-%s.tar.gz"):format(netcoredbg_version, arch)
  vim.notify(("dap: downloading netcoredbg %s (linux-%s)"):format(netcoredbg_version, arch))
  vim.fn.mkdir(dir, "p")
  run({ "sh", "-c", 'curl -fsSL "$1" | tar -xz -C "$2"', "_", url, dir }, function(res)
    if res.code ~= 0 or not vim.uv.fs_stat(vim.fs.joinpath(dir, "netcoredbg", "netcoredbg")) then
      vim.fn.delete(dir, "rf")
      return fail("netcoredbg download failed " .. vim.trim(res.stderr or ""))
    end
    cb(dir)
  end)
end

local function inject_netcoredbg(container, cb)
  run({ docker, "inspect", "--format", "{{.Image}}", container }, function(res)
    if res.code ~= 0 then
      return fail("could not inspect " .. container .. " " .. vim.trim(res.stderr or ""))
    end

    run({ docker, "image", "inspect", "--format", "{{.Architecture}}", vim.trim(res.stdout) }, function(img)
      local arch = vim.trim(img.stdout or "")
      if arch ~= "amd64" and arch ~= "arm64" then
        return fail("no netcoredbg build for container architecture '" .. arch .. "'")
      end

      -- the release builds are glibc only
      run({ docker, "exec", container, "sh", "-c", "ls /lib/ld-musl-* >/dev/null 2>&1" }, function(musl)
        if musl.code == 0 then
          return fail(container .. " is musl based (alpine), netcoredbg has no release build for it")
        end

        download_netcoredbg(arch, function(dir)
          local target = vim.fs.dirname(injected_netcoredbg)
          run({ docker, "cp", vim.fs.joinpath(dir, "netcoredbg") .. "/.", container .. ":" .. target }, function(cp)
            if cp.code ~= 0 then
              return fail("could not copy netcoredbg into " .. container .. " " .. vim.trim(cp.stderr or ""))
            end
            vim.notify("dap: injected netcoredbg into " .. container .. ":" .. target)
            cb(injected_netcoredbg)
          end)
        end)
      end)
    end)
  end)
end

-- configured path > previously injected copy > inject
local function ensure_netcoredbg(container, path, cb)
  run({ docker, "exec", container, "test", "-x", path }, function(res)
    if res.code == 0 then
      return cb(path)
    end
    run({ docker, "exec", container, "test", "-x", injected_netcoredbg }, function(injected)
      if injected.code == 0 then
        return cb(injected_netcoredbg)
      end
      inject_netcoredbg(container, cb)
    end)
  end)
end

-- path mapping
-- netcoredbg has no sourceFileMap, so source paths are rewritten on the nvim side instead
-- sourceFileMap = { ["/src"] = "/Users/me/project" } (container -> host, same shape as vscode)
local remembered_maps = {}

local function translate(map, path, to_host)
  for remote, host in pairs(map) do
    local from, to = remote:gsub("/$", ""), host:gsub("/$", "")
    if not to_host then
      from, to = to, from
    end
    if path == from or vim.startswith(path, from .. "/") then
      return to .. path:sub(#from + 1)
    end
  end
  return path
end

local function translate_sources(map, value, to_host)
  if type(value) ~= "table" then
    return
  end
  if type(value.source) == "table" and type(value.source.path) == "string" then
    value.source.path = translate(map, value.source.path, to_host)
  end
  for _, child in pairs(value) do
    translate_sources(map, child, to_host)
  end
end

dap.listeners.on_session.netcoredbg_source_map = function(_, session)
  local map = session and session.config.sourceFileMap
  if not map or next(map) == nil or session.source_map_applied then
    return
  end
  session.source_map_applied = true

  local request, handle_body = session.request, session.handle_body

  -- host -> container for everything sent (setBreakpoints, gotoTargets, ...)
  function session:request(command, arguments, on_result)
    if type(arguments) == "table" then
      arguments = vim.deepcopy(arguments)
      translate_sources(map, arguments, false)
    end
    return request(self, command, arguments, on_result)
  end

  -- container -> host for everything received (stackTrace, breakpoint events, ...)
  function session:handle_body(body)
    if body:find('"source"', 1, true) then
      local ok, decoded = pcall(vim.json.decode, body)
      if ok and type(decoded) == "table" then
        translate_sources(map, decoded, true)
        body = vim.json.encode(decoded)
      end
    end
    return handle_body(self, body)
  end
end

-- explicit sourceFileMap > bind mount covering cwd > ask for the container source root
local function resolve_source_map(config, container, cb)
  if config.sourceFileMap then
    return cb(config.sourceFileMap)
  end

  local key = container or "default"
  if remembered_maps[key] then
    return cb(remembered_maps[key])
  end

  local cwd = vim.fn.getcwd()
  local function done(map)
    remembered_maps[key] = map
    cb(map)
  end

  if container then
    local mounts = system_lines({ docker, "inspect", container, "--format", "{{range .Mounts}}{{.Source}}\t{{.Destination}}\n{{end}}" }) or {}
    for _, line in ipairs(mounts) do
      local source, destination = unpack(vim.split(line, "\t"))
      if source and destination and vim.startswith(cwd .. "/", source .. "/") then
        return done({ [destination] = source })
      end
    end
  end

  vim.ui.input({ prompt = "Container source root for " .. cwd .. ": ", default = "/src" }, function(remote)
    if remote and remote ~= "" then
      done({ [remote] = cwd })
    else
      cb(nil)
    end
  end)
end

vim.api.nvim_create_user_command("DapResetSourceMap", function()
  remembered_maps = {}
end, { desc = "Forget container source roots" })

-- resolves the source map and pid before the adapter is started
local function enrich(container)
  return function(config, on_config)
    resolve_source_map(config, container, function(map)
      config = vim.tbl_extend("force", config, { sourceFileMap = map })
      if config.processId then
        return on_config(config)
      end

      local function done(pid)
        on_config(vim.tbl_extend("force", config, { processId = pid }))
      end

      if container then
        pick_process(container, done)
      else
        vim.ui.input({ prompt = "Process id: " }, function(pid)
          if tonumber(pid) then done(tonumber(pid)) end
        end)
      end
    end)
  end
end

-- adapter
--   container = "name"  -> netcoredbg is started inside the container via `docker exec -i` (stdio), injected if missing
--   container = true    -> same, but pick the container from `docker ps`
--   port = 4711         -> connect to `netcoredbg --interpreter=vscode --server=4711` published by the container
--   neither             -> local netcoredbg
-- the type is named coreclr so easy-dotnet's variable pretty printing hooks into the session
dap.adapters.coreclr = function(callback, config)
  if config.port then
    local container = type(config.container) == "string" and config.container or nil
    return callback({
      type = "server",
      host = config.host or "127.0.0.1",
      port = config.port,
      enrich_config = enrich(container),
    })
  end

  local function exec_in(container)
    ensure_netcoredbg(container, config.netcoredbg or default_netcoredbg, function(netcoredbg)
      callback({
        type = "executable",
        command = docker,
        args = { "exec", "-i", container, netcoredbg, "--interpreter=vscode" },
        enrich_config = enrich(container),
      })
    end)
  end

  if type(config.container) == "string" then
    exec_in(config.container)
  elseif config.container then
    pick_container(exec_in)
  else
    callback({
      type = "executable",
      command = "netcoredbg",
      args = { "--interpreter=vscode" },
      enrich_config = enrich(nil),
    })
  end
end

-- configurations, projects can add their own in .vscode/launch.json with "type": "coreclr"
local configurations = {
  {
    type = "coreclr",
    request = "attach",
    name = "Attach: netcoredbg in container",
    container = true,
    justMyCode = true,
  },
  {
    type = "coreclr",
    request = "attach",
    name = "Attach: netcoredbg server (port)",
    host = "127.0.0.1",
    port = function()
      return tonumber(vim.fn.input("netcoredbg port: ", "4711")) or dap.ABORT
    end,
    justMyCode = true,
  },
}
dap.configurations.cs = configurations
dap.configurations.fsharp = configurations

-- ui
dapui.setup()

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- variable values inline next to their definition while stopped (uses treesitter)
require("nvim-dap-virtual-text").setup({
  virt_text_pos = "eol",
})

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" })
vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DiagnosticHint" })

-- keymaps (same layout as vimspector HUMAN)
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Dap: Continue / start" })
vim.keymap.set("n", "<F3>", dap.terminate, { desc = "Dap: Stop" })
vim.keymap.set("n", "<F4>", dap.restart, { desc = "Dap: Restart" })
vim.keymap.set("n", "<F6>", dap.pause, { desc = "Dap: Pause" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Dap: Toggle breakpoint" })
vim.keymap.set("n", "<leader><F9>", function()
  dap.set_breakpoint(vim.fn.input("Condition: "))
end, { desc = "Dap: Conditional breakpoint" })
vim.keymap.set("n", "<F8>", dap.run_to_cursor, { desc = "Dap: Run to cursor" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Dap: Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Dap: Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Dap: Step out" })
vim.keymap.set("n", "<leader><F11>", dap.up, { desc = "Dap: Up stack frame" })
vim.keymap.set("n", "<leader><F12>", dap.down, { desc = "Dap: Down stack frame" })

vim.keymap.set({ "n", "x" }, "<leader>di", function() dapui.eval() end, { desc = "Dap: Inspect hover" })
vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Dap: Toggle ui" })
vim.keymap.set("n", "<leader>b", function()
  dapui.float_element("breakpoints", { enter = true })
end, { desc = "Dap: Breakpoints window" })
