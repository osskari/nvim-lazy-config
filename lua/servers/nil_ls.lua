local M = {}

M.config = function(capabilities)
  vim.lsp.config("nil_ls", {
    capabilities = capabilities,
  })
end

return M
