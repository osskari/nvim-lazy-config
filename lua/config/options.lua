vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.autoformat = true

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.foldlevel = 99

vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"

vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

vim.opt.shiftround = true
vim.opt.shiftwidth = 2

vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true

vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5
vim.opt.wrap = false

vim.opt.smoothscroll = true

vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
vim.g.loaded_ruby_provider = 0

vim.g.markdown_recommended_style = 0

vim.opt.colorcolumn = "80"
