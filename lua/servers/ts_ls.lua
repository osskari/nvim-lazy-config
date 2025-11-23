return function(capabilities)
  vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    filetypes = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    },
    settings = {
      typescript = {
        indentStyle = "space",
        intentSize = 2,
      },
    },
  })
end
