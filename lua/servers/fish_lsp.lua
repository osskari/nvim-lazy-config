local M = {}

M.config = function(capabilities)
  vim.lsp.config('fish_lsp', {
    capabilities = capabilities,
  })
end

return M
