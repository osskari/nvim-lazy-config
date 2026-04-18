local M = {}

M.configure = function(name, capabilities, config)
  config["capabilities"] = capabilities

  vim.lsp.config[name] = config
  vim.lsp.enable(name)
end

local read_files = function(dir)
  local path = vim.fn.expand(vim.fn.stdpath("config") .. "/lua/" .. dir)

  local pattern = path:match("/$") and path .. "*.lua" or path .. "/*.lua"
  local files = vim.fn.glob(pattern, true, true)

  if type(files) == "string" then
    if files ~= "" then
      files = { files }
    else
      files = {}
    end
  end

  return files
end

M.load_servers = function()
  local servers = {}

  local files = read_files("servers")

  for _, filepath in ipairs(files) do
    if not string.find(filepath, "init.lua") then
      local server = dofile(filepath)

      table.insert(servers, server)
    end
  end

  return servers
end

M.debug = function()
  local a = read_files("servs")

  local names = {}
  local servers = {}
  local configs = {}
  local efms = {}

  for _, value in ipairs(a) do
    local file = dofile(value)

    if file.skip and file.skip == true then
      goto continue
    end

    if file.name then
      table.insert(names, file.name)
    end

    if file.servers then
      for _, s in ipairs(file.servers) do
        table.insert(servers, s)
      end
    end

    if file.config then
      configs[file.name] = file.config
    end

    if file.efmConfig then
      efms[file.name] = file.efmConfig
    end

    ::continue::
  end

  Snacks.debug.inspect(efms)
end

return M
