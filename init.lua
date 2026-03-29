require("opts")
require("keymap")
require("autocmd")

local utils = require("utils")

-- load dependencies when  not on nix
if not utils.isNix() then
  require("init_package_manager").setup()

  local deps = utils.loadDependencies()

  for _, v in ipairs(deps) do
    MiniDeps.add(v)
  end
end

-- lazy load
local configs = utils.loadConfig()
require("lz.n").load(configs)
