local M = {}

M.config = function(capabilities)
  vim.lsp.config("gopls", {
    capabilities = capabilities,
    filetypes = { "go" },
  })
end

return M
