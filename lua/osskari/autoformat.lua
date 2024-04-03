vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*",
        group = "AutoFormat",
        callback = function()
            vim.lsp.buf.format({async = true})
        end,
    }
)
