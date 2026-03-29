local M = {}

M.isNix = function()
  return vim.fn.isdirectory("/nix") == 1
end

local function getConfig()
  local modules = {}

  local expanded_path = vim.fn.expand(vim.fn.stdpath("config") .. "/lua/plugins")

  local pattern = expanded_path:match('/$') and expanded_path .. '*.lua' or expanded_path .. '/*.lua'
  local lua_files = vim.fn.glob(pattern, true, true)

  if type(lua_files) == 'string' then
    if lua_files ~= '' then
      lua_files = { lua_files }
    else
      lua_files = {}
    end
  end

  for _, filepath in ipairs(lua_files) do
    local module = dofile(filepath)

    table.insert(modules, module)
  end

  return modules
end

M.loadDependencies = function()
  local packs = {}

  local plugins = getConfig()

  for _, v in ipairs(plugins) do
    table.insert(packs, v.pack)
  end

  return packs
end

M.loadConfig = function()
  local configs = {}

  local plugins = getConfig()

  for _, v in ipairs(plugins) do
    table.insert(configs, v.load)
  end

  return configs
end

return M
