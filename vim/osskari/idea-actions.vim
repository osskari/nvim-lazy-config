" Telescope replacement
map <leader>ff <Action>(GotoFile)
map <leader>fs <Action>(FileStructurePopup)
map <leader>fl <Action>(FindInPath)

" Diagnostics
map [d <Action>(GotoPreviousError)
map ]d <Action>(GotoNextError)

" Comment
Plug 'tpope/vim-commentary'

" Highlight yank
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = "100"
let g:highlightedyank_highlight_color = "#2D4F67"

" LSP actions
map <leader>cr <Action>(RenameElement)
map <leader>cf <Action>(ReformatCode)

" File tree
" map <leader>ee <Action>(ActivateProjectToolWindow)

map <leader>e <Action>(ShowErrorDescription)

map gi <Action>(ReSharperGotoImplementation)
