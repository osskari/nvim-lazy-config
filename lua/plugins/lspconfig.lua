return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "creativenull/efmls-configs-nvim"
  },
  event = "BufReadPre",
  config = function()
    require("utils.diagnostics").setup()
    require("servers")
  end,
}
