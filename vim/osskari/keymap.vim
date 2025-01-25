" Move between splits
nnoremap <C-h> <C-w>h " Go to left window
nnoremap <C-j> <C-w>j " Go to down window
nnoremap <C-k> <C-w>k " Go to up window
nnoremap <C-l> <C-w>l " Go to right window


" Resize windows
nnoremap <A-Up> :resize +2<CR> " Increase window size horizontally
nnoremap <A-Down> :resize -2<CR> " Decrease window size horizontally
nnoremap <A-Left> :vertical resize -2<CR> " Increase window size vertically
nnoremap <A-Right> :vertical resize +2<CR> " Decrease window size vertically

" Move Lines
nnoremap <A-j> :execute 'move .+' . v:count1<cr>==
nnoremap <A-k> :execute 'move .-' . (v:count1 + 1)<cr>==
inoremap <A-j> <esc>:m .+1<cr>==gi
inoremap <A-k> <esc>:m .-2<cr>==gi
vnoremap <A-j> :<C-u>execute "'<,'>move '>+" . v:count1<cr>gv=gv
vnoremap <A-k> :<C-u>execute "'<,'>move '<-" . (v:count1 + 1)<cr>gv=gv

" Buffers
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
nnoremap <leader>bc :bdelete<cr>

" Clear search highlighting
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>
vnoremap <silent> <Esc> <Esc>:nohlsearch<CR><Esc>
inoremap <silent> <Esc> <Esc>:nohlsearch<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv
nnoremap < v<
nnoremap > v>

" Open location or quickfix list
nnoremap <leader>xl :lopen<cr>
nnoremap <leader>xq :copen<cr>

" Quickfix navigation
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>

" Split window
nnoremap <leader>- <C-W>s
nnoremap <leader>\| <C-W>v
