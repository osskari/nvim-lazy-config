require("opts")
require("keymap")
require("autocmd")

local loader = require("loader")
local packs, loads = loader.load_packages("/lua/plugins/")

-- skip this in nix
require("paqman").bootstrap(packs)

require("colorscheme")
require("lz.n").load(loads)
