local fzf = require("fzf-lua")

fzf.setup({})

vim.keymap.set("n", "<leader>ff", function() fzf.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() fzf.live_grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", function() fzf.help_tags() end, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>fx", function() fzf.diagnostics_document() end, { desc = "Show document diagnostics" })
vim.keymap.set("n", "<leader>fX", function() fzf.diagnostics_workspace() end, { desc = "Show workspace diagnostics" })
vim.keymap.set("n", "<leader>fs", function() fzf.lsp_document_symbols() end, { desc = "Show lsp document symbols" })
vim.keymap.set("n", "<leader>fS", function() fzf.lsp_workspace_symbols() end, { desc = "Show lsp workspace symbols" })
