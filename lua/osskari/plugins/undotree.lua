return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle the undo history" })
    end,
}
