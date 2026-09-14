local utils = require("utils.lsp")

-- treesitter
require("tree-sitter-manager")._install_single("lua")

-- mason
utils.mason_install("lua-language-server")

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
local go_revive = utils.req_efm("go_revive", "linter")
local gofumpt = utils.req_efm("gofumpt", "formatter")

vim.lsp.config("efm", {
  filetypes = { "lua" },
  settings = {
    languages = {
      lua = { go_revive, gofumpt },
    },
  },
})
