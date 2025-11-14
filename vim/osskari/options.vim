" Set leader
let g:mapleader=' '
let mapleader=' '
let g:maplocalleader=' '
let maplocalleader=' '

let g:autoformat=1

" Numbers
set nu
set relativenumber
set cursorline

set colorcolumn=80

" Clipboard
if has('mac')
  set clipboard+=unnamedplus 
  let g:clipboard = {
        \  'name': 'macOS-clipboard',
        \  'copy': {
        \    '+': 'pbcopy', 
        \    '*': 'pbcopy',
        \  },
        \  'paste': {
        \    '+': 'pbpaste', 
        \    '*': 'pbpaste',
        \  },
        \  'cache_enabled': 1,
        \ }
elseif has('wsl')
  set clipboard+=unnamedplus 
  let g:clipboard = {
        \  'name': 'WSL-clipboard',
        \  'copy': {
        \    '+': 'wcopy', 
        \    '*': 'wcopy',
        \  },
        \  'paste': {
        \    '+': 'wpaste', 
        \    '*': 'wpaste',
        \  },
        \  'cache_enabled': 1,
        \ }
endif

set completeopt=menu,menuone,noselect
set conceallevel=2
set cursorline
set expandtab

set fillchars=foldopen:,foldclose:,fold:\ ,foldsep:\ ,diff:╱,eob:\ 

set foldlevel=99

set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep
set ignorecase
set inccommand=nosplit

set jumpoptions=view
set laststatus=3
set linebreak
set number

set pumblend=10
set pumheight=10
set relativenumber

set scrolloff=10
set sidescrolloff=8

set shiftround
set shiftwidth=2

set signcolumn=yes
set smartcase
set smartindent

set splitbelow
set splitkeep=screen
set splitright
set tabstop=2
set termguicolors

set undofile
set undolevels=1000
set wildmode=longest:full,full
set winminwidth=5
set nowrap

set smoothscroll

