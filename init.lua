local function source_file(path)
  vim.cmd('source' .. vim.fn.stdpath('config') .. path)
end

source_file('/vim/osskari/options.vim')
require("config.autocmds")
source_file('/vim/osskari/keymap.vim')
require("config.keymap")
require("config.lazy")
