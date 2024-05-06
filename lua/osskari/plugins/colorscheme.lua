return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      colors = {
        theme = {
          wave = {
            ui = {
              bg_visual = "#2D4F67"
            }
          }
        }
      }
    })

    vim.cmd("colorscheme kanagawa")
  end,
}
