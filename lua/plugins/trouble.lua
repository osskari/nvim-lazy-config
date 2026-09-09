-- add deps
vim.pack.add({ "https://github.com/folke/trouble.nvim" })

-- config
require("trouble").setup({})

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("diagnostics") end,       { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", function() require("trouble").toggle("diagnostics", { filter = { buf = 0 } }) end, { desc = "Buffer diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xL", function() require("trouble").toggle("loclist") end,           { desc = "Location list (Trouble)" })
vim.keymap.set("n", "<leader>xQ", function() require("trouble").toggle("qflist") end,            { desc = "Quickfix list (Trouble)" })
