-- add deps
vim.pack.add({"https://github.com/nvim-tree/nvim-tree.lua", "https://github.com/nvim-tree/nvim-web-devicons"})

-- config
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  filters = {
    git_ignored = false,
  }
})

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>ee", api.tree.toggle)
vim.keymap.set("n", "<leader>ef", function ()
  -- if in a tree toggle it
  if api.tree.is_tree_buf() then
    api.tree.toggle()
    return
  end
  -- if not in tree open it highlighting the current file
  api.tree.find_file({
    focus = true,
    open = true,
  })
end)
