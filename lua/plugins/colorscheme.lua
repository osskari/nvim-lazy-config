return {
  pack = { source = "catppuccin/nvim", name = "catppuccin" },
  load = {
    "catppuccin",
    after = function()
      vim.cmd.colorscheme("catppuccin-nvim")
    end,
  },
}
