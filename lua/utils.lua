local M = {}

M.isNix = function()
  return vim.fn.isdirectory("/nix") == 1
end

local function getConfig()
  return require("plugins")
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
