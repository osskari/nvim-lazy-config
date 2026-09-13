-- add deps
vim.pack.add({
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  "https://github.com/nvim-lua/plenary.nvim",
})

-- configuration
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

vim.keymap.set("n", "<leader>hh", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>hp", function()
  harpoon:list():prev()
end)

vim.keymap.set("n", "<leader>hn", function()
  harpoon:list():next()
end)


vim.keymap.set("n", "<leader>h1", function ()
  harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader>h2", function ()
  harpoon:list():select(2)
end)

vim.keymap.set("n", "<leader>h3", function ()
  harpoon:list():select(3)
end)

vim.keymap.set("n", "<leader>h4", function ()
  harpoon:list():select(4)
end)

vim.keymap.set("n", "<leader>h5", function ()
  harpoon:list():select(5)
end)

vim.keymap.set("n", "<leader>h6", function ()
  harpoon:list():select(6)
end)

vim.keymap.set("n", "<leader>h7", function ()
  harpoon:list():select(7)
end)
