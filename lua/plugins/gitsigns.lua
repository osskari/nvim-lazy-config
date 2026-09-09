-- add deps
vim.pack.add({"https://github.com/lewis6991/gitsigns.nvim"})

-- config
require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  }
})
