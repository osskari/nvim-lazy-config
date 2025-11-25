local M = {}

M.require_vim = function(path)
  vim.cmd('source' .. vim.fn.stdpath('config') .. '/' .. path)
end

return M
