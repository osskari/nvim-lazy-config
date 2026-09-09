-- add deps
vim.pack.add({"https://github.com/nvim-lualine/lualine.nvim"})

-- config
require('lualine').setup({
  options = {
    theme = "auto",
    icons_enabled = true,
  }
})
