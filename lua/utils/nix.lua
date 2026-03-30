local M = {}

M.isNix = function()
  return vim.fn.isdirectory("/nix") == 1
end

return M
