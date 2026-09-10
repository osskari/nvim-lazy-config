require("utils.lsp").configure("pyright", {
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
})
