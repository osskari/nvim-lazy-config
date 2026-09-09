-- add deps
vim.pack.add({"https://github.com/folke/snacks.nvim"})

-- config
require("snacks").setup({
  -- if a file is very big strip a lot of extra goodies from the buffer
  -- for performance
  bigfile = {
    enabled = true,
    notify = true,
  },
  -- delete buffers without disrupting the layout
  bufdelete = {
    enabled = true,
  },
  -- nice debugging prints
  debug = {
    enabled = true,
  },
  -- lazygit float
  lazygit = {
    enabled = true,
  },
  -- open terminal float
  terminal = {
    enabled = true,
    win = {
      style = "terminal",
      position = "float",
      border = "rounded",
      height = 0.8,
      width = 0.8,
    },
  },
})

-- bufdelete
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Close the current buffer" })
-- lazygit
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit.open() end, { desc = "Open lazygit" })
-- terminal
vim.keymap.set({ "n", "t" }, "<c-t>", function() Snacks.terminal.toggle(nil, {  }) end, { desc = "Toggle terminal" })
