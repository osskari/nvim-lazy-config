" Center screen when jumping
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Buff navigation
nnoremap <leader>bn :bnext<CR>h
nnoremap <leader>bp :bprevious<CR>h

" Tab navigation
map <C-S-H> <Action>(PreviousTab)
map <C-S-L> <Action>(NextTab)

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Splitting & Resizing
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>
map <leader>cs <Action>(CloseAllEditors)

" Better indenting in visual mode
nnoremap < v<
nnoremap > v>
vnoremap < <gv
vnoremap > >gv

" Better J behavior
nnoremap J mzJ`z

" Clear hlsearch
nnoremap <silent> <Esc> :nohlsearch<CR>

" fuzzy finding
map <leader>ff <Action>(GotoFile)
map <leader>fs <Action>(FileStructurePopup)
map <leader>fg <Action>(FindInPath)

map <leader>cf <Action>(ReformatCode)
map <leader>cr <Action>(RenameElement)
map <leader>ca <Action>(ShowIntentionActions)

map <leader>eh <Action>(ShowErrorDescription)
map <leader>en <Action>(GotoNextError)
map <leader>ep <Action>(GotoPreviousError)
map <leader>xx <Action>(ActivateProblemsViewToolWindow)

map <leader>nn <Action>(NewElement)
