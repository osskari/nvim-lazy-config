-- Put global remaps for NeoVim here
local map = vim.keymap.set

map("n", "<leader>wa", vim.cmd.Wall, { desc = "Save current buffer" })

map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

map('i', '<C-Enter>', '<Esc>o', { desc = 'Move cursor to a new line below' })
