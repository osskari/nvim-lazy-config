local lsp_utils = require("utils.lsp")
local utils = require("utils")

-- treesitter
utils.ensure_treesitter_installed("lua")

-- mason
lsp_utils.mason_install({
  "lua-language-server",
  "luacheck",
  "stylua",
})

-- lsp
require("utils.lsp").configure("lua_ls", {
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$HOME/config") .. "/nvim/lua",
        },
      },
    },
  },
})

-- efm
local go_revive = lsp_utils.req_efm("go_revive", "linter")
local gofumpt = lsp_utils.req_efm("gofumpt", "formatter")

vim.lsp.config("efm", {
  filetypes = { "lua" },
  settings = {
    languages = {
      lua = { go_revive, gofumpt },
    },
  },
})
