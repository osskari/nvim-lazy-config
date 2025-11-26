local M = {}

M.config = function(capabilities)
  vim.lsp.config("pyright", {
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
  })
end

return M
