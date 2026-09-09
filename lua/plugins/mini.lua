-- add deps
vim.pack.add({
  -- extend and create a/i textobjects
  "https://github.com/nvim-mini/mini.ai",
  -- comment lines
  "https://github.com/nvim-mini/mini.comment",
  -- autopairs
  "https://github.com/nvim-mini/mini.pairs",
  -- args in one or multi line
  "https://github.com/nvim-mini/mini.splitjoin",
  -- surround things
  "https://github.com/nvim-mini/mini.surround",
  -- icon provider
  "https://github.com/nvim-mini/mini.icons",
  -- highlight trailing whitespace
  "https://github.com/nvim-mini/mini.trailspace",
})

-- config
-- ai
require("mini.ai").setup({})
-- comment
require("mini.comment").setup({})
-- autopairs
require("mini.pairs").setup({})
-- splitjoin
require("mini.splitjoin").setup({})
-- surround
require("mini.surround").setup({})
-- icons
require("mini.icons").setup({})
-- trailspace
require("mini.trailspace").setup({})
