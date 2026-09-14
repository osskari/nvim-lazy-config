local lsp_utils = require("utils.lsp")
local utils = require("utils")

-- treesitter
utils.ensure_treesitter_installed("bash")

-- mason
lsp_utils.mason_install({
  "bash-language-server",
  "shellcheck",
  "shfmt",
})

-- lsp
require("utils.lsp").configure("bashls", {
  filetypes = { "sh", "bash", "zsh" },
})

-- efm
local shellcheck = lsp_utils.req_efm("shellcheck", "linter")
local shfmt = lsp_utils.req_efm("shfmt", "formatter")

vim.lsp.config("efm", {
  filetypes = { "sh" },
  settings = {
    languages = {
      sh = { shellcheck, shfmt },
    },
  },
})
