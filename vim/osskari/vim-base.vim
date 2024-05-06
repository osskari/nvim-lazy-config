" Set leader
let g:mapleader=' '
let mapleader=' '
let g:maplocalleader=' '
let maplocalleader=' '

" Numbers
set nu
set relativenumber
set cursorline

" Indents
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Wrapping
set nowrap

" Undos
set swapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Search
set incsearch
set smartcase
set ignorecase

" Colors
set termguicolors

" Scrollof
set scrolloff=10
set signcolumn=yes
set isfname+=@-@

" Timeouts
set updatetime=250
set timeoutlen=300

" Splits
set splitright
set splitbelow

" Clear hlsearch
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<CR>
