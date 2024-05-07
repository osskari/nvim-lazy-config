return {
    'lfilho/cosco.vim',
    dependencies = {
        'tpope/vim-repeat',
    },
    config = function()
        vim.keymap.set({ 'n', 'i' }, '<C-;>', vim.cmd.CommaOrSemiColon)
    end
}
