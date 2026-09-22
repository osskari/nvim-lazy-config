local utils = require("utils")

-- add deps
vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/rafamadriz/friendly-snippets",
  utils.url("github", "kristijanhusak/vim-dadbod-completion"),
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
      auto_show = true,
    },
    menu = {
      draw = {
        columns = {
          {
            "label",
            "label_description",
            gap = 1,
          },
          {
            "kind_icon",
            "kind",
          },
        },
      },
    },
  },
  signature = { enabled = true },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      sql = { "dadbod" },
    },
    providers = {
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      snippets = {
        opts = {
          friendly_snippets = true,
        },
      },
    },
  },
})
