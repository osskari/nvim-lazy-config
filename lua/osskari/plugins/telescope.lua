return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "molecule-man/telescope-menufacture"
    },
    config = function()
        require("telescope").load_extension "menufacture"

        local cmds = require("telescope").extensions.menufacture
        vim.keymap.set('n', '<leader>ff', cmds.find_files)
        vim.keymap.set('n', '<leader>fg', cmds.live_grep)
        vim.keymap.set('n', '<leader>fw', cmds.grep_string)
        vim.keymap.set('n', '<leader>fg', cmds.git_files)
    end,
}
