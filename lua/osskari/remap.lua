-- Put global remaps here
local keymap = vim.keymap

keymap.set("n", "<leader>wa", ":Wall<CR>", { desc = "Save current buffer" })

keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
