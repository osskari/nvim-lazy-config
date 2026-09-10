-- add deps
vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
})

-- config
local cmp = require("blink.cmp")

cmp.build():pwait()
cmp.setup({
  keymap = {
    preset = "super-tab",
  },
  completion = {
    documentation = {
      auto_show = false,
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})

