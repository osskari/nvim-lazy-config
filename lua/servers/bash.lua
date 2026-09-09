local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config["bashls"] = {
  capabilities = capabilities,
  filetypes = { "sh", "bash", "zsh", },
}
vim.lsp.enable("bashls")
