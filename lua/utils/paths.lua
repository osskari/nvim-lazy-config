local M = {}

M.require_vim = function(path)
  vim.cmd('source ' .. vim.fn.stdpath('config') .. '/vim/' .. path:gsub("%.", "/") .. '.vim')
end

M.find_lsp_configurations = function()
  local configs = {}
  for file in io.popen('ls -1 ' .. vim.fn.stdpath('config') .. '/lua/servers/*.lua'):lines() do
    table.insert(configs, file:match('([^/]+)%.lua$'))
  end
  return configs
end

return M
