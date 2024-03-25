-- Put global remaps here
local keymap = vim.keymap

-- Split navigation
keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to left split" })
keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to lower split" })
keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to upper split" })
keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to right split" })
