return {
  name = "pyright",
  config = {
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
  },
}
