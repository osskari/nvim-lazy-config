return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require('which-key')

        wk.register({
            ["<leader>"] = {
            f = { name = "File" },
            h = { name = "Harpoon" },
            c = { name = "CodeContext" },
            e = { name = "FileExplorer" },
            g = { name = "GoTo" },
            u = { name = "UndoTree" }
            }
        })
    end,
}
