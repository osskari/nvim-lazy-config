local helpers = require('helpers')

helpers.source_vim_file('/vim/osskari/options.vim')
require("config.autocmds")
helpers.source_vim_file('/vim/osskari/keymap.vim')
require("config.keymap")
require("config.lazy")
