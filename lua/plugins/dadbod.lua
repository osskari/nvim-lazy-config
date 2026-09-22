local utils = require("utils")

vim.pack.add({
  utils.url("github", "kristijanhusak/vim-dadbod-ui"),

  utils.url("github", "tpope/vim-dadbod"),
  utils.url("github", "kristijanhusak/vim-dadbod-completion"),
})

vim.g.db_ui_use_nerd_fonts = 1

local path = vim.fs.joinpath(vim.fs.root(0, '.git'), 'dadbod.lua')
local path_stat = vim.uv.fs_stat(path)

if path_stat == nil then
  return
elseif path_stat.type ~= "file" then
  return
end

vim.g.dbs = dofile(path)
