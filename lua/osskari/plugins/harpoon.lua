return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Add current file to harpoon list" })
        vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle the harpoon ui" })

        vim.keymap.set("n", "<leader>hn", function() harpoon:list():prev() end, { desc = "Go to previous hook" })
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():next() end, { desc = "Go to next hook" })

        vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Go to hook 1" })
        vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Go to hook 2" })
        vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Go to hook 3" })
        vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Go to hook 4" })
    end,
}
