local M = {}

M.config = function(capabilities)
  vim.lsp.config("charp_ls", {
    capabilities = capabilities,
  })
end

return M
