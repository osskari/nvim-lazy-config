return {
  pack = { source = "lewis6991/gitsigns.nvim" },
  load = {
    "gitsigns.nvim",
    after = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        }
      })
    end
  },
}
