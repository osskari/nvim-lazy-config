local paths = require('utils.paths')

local M = {}

M.setup = function()
  require('config.globals')
  require('config.keymaps')
  require("config.options")
  require("config.autocmds")
end

return M
