return {
  pack = { source = "nvim-lualine/lualine.nvim" },
  load = {
    "lualine.nvim",
    after = function()
      require('lualine').setup({
      options = {
        theme = "auto",
        icons_enabled = true,
      }
    })
    end
  },
}
