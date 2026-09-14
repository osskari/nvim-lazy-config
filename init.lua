-- cache imports
require("loader")
-- opts
require("opts")
-- base keybinds
require("keymap")
-- base autocmds
require("autocmd")
-- colorscheme
require("colorscheme")
-- startuptime
vim.pack.add({ "https://github.com/dstein64/vim-startuptime" })

require("utils").require_all("plugins")
