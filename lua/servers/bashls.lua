local M = {}

M.config = function(capabilities)
  vim.lsp.config("bashls", {
    capabilities = capabilities,
    filetypes = { "sh", "bash", "zsh" },
  })
end

return M
