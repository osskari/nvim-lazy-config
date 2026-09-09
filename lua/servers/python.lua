local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config["pyright"] = {
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    pyright = {
      disableOrganizeImports = false,
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
      },
    },
  },
}
vim.lsp.enable("pyright")

