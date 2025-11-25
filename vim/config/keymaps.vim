" Center screen when jumping
nnoremap n nzzzv " Next search result (centered)
nnoremap N Nzzzv " Previous search result (centered)
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Buffer navigation
nnoremap <leader>bn :bnext<CR>h " Next buffer
nnoremap <leader>bp :bprevious<CR>h " Previous buffer

" Better window navigation
nnoremap <C-h> <C-w>h " Move to left window
nnoremap <C-j> <C-w>j " Move to bottom window
nnoremap <C-k> <C-w>k " Move to top window
nnoremap <C-l> <C-w>l " Move to right window

" Splitting & Resizing
nnoremap <leader>sv :vsplit<CR> " Split window vertically
nnoremap <leader>sh :split<CR> " Split window horizontally
nnoremap <C-Up> :resize +2<CR> " Increase window height
nnoremap <C-Down> :resize -2<CR> " Decrease window height
nnoremap <C-Left> :vertical resize -2<CR> " Decrease window width
nnoremap <C-Right> :vertical resize +2<CR> " Increase window width

" Better indenting in visual mode
nnoremap < v<h " Indent left
nnoremap > v>h " Indent right
vnoremap < <gvh " Indent left and reselect
vnoremap > >gvh " Indent right and reselect

" Better J behavior
nnoremap J mzJ`zh " Join lines and keep cursor position

" Quick config editing
nnoremap <leader>rc :e ~/.config/nvim/init.lua<CR> " Edit config

" File Explorer
nnoremap <leader>m :NvimTreeFocus<CR> " Focus on File Explorer
nnoremap <leader>e :NvimTreeToggle<CR> " Toggle File Explorer

" Clear hlsearch
nnoremap <silent> <Esc> :nohlsearch<CR>h " Clear hlsearch
