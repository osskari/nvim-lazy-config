return {
  name = "pyright",
  servers = {
    "pyright",
    "flake8",
    "black",
  },
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
  efmConfig = {
    python = {
      linter = "flake8",
      formatter = "black",
    },
  },
}
