local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config["ts_ls"] = {
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
  }
}
vim.lsp.enable("ts_ls")
