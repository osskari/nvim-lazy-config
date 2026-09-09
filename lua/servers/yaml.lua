local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config["yamlls"] = {
  capabilities = capabilities,
}
vim.lsp.enable("yamlls")
