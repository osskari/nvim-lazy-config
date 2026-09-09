local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config["fish_lsp"] = {
  capabilities = capabilities,
}
vim.lsp.enable("fish_lsp")
