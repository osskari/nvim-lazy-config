local paths = require('utils.paths')

local M = {}

M.setup = function()
  paths.require_vim('config.globals')
  paths.require_vim('config.keymaps')
  paths.require_vim("config.options")
  require("config.options")
  require("config.autocmds")
end

return M
