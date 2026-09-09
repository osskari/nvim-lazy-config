-- add deps
vim.pack.add({"https://github.com/nvim-tree/nvim-tree.lua", "https://github.com/nvim-tree/nvim-web-devicons"})

-- config
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>e", api.tree.toggle)
