-- add deps
vim.pack.add({"https://github.com/puremourning/vimspector"})

-- config
vim.g.vimspector_enable_mappings = "HUMAN"

vim.keymap.set({"n", "x"}, "<leader>di", "<Plug>VimspectorBalloonEval", { remap = true, desc = "Vimspector: Inspect hover" })
vim.keymap.set("n", "<leader><F11>", "<Plug>VimspectorUpFrame", { remap = true, desc = "Vimspector: Up stack frame" })
vim.keymap.set("n", "<leader><F12>", "<Plug>VimspectorDownFrame", { remap = true, desc = "Vimspector: Down stack frame" })
vim.keymap.set("n", "<leader>b", "<Plug>VimspectorBreakpoints", { remap = true, desc = "Vimspector: Toggle breakpoints window" })
vim.keymap.set("n", "<leader>d", "<Plug>VimspectorDisassemble", { remap = true, desc = "Vimspector: Toggle dissassembly view" })

