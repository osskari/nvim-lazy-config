return {
  pack = {
    "catppuccin/nvim",
    as = "catppuccin",
    build = function()
      vim.cmd.colorscheme "catppuccin-nvim"
    end,
  }
}
