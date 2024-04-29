vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- wrap
vim.opt.wrap = false

-- undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- colors
vim.opt.termguicolors = true

-- scrolloff
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- columns
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = 'yes'


-- timeouts
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- split directions
vim.opt.splitright = true
vim.opt.splitbelow = true

-- highlight current cursor line
vim.opt.cursorline = true

-- clear highlight search
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- flash highlighted area on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
