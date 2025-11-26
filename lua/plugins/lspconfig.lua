return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "creativenull/efmls-configs-nvim"
  },
  event = "BufReadPre",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp = require('utils.lsp')
    local configured_servers = require("utils.paths").find_lsp_configurations()

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    })

    lsp.setup_lsp(configured_servers, capabilities)
  end,
}
