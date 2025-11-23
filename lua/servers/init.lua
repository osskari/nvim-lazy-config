local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("servers.bash_ls")(capabilities)
require("servers.csharp_ls")(capabilities)
require("servers.efm")(capabilities)
require("servers.fish_ls")(capabilities)
require("servers.gopls")(capabilities)
require("servers.lua_ls")(capabilities)
require("servers.nil")(capabilities)
require("servers.pyright")(capabilities)
require("servers.ts_ls")(capabilities)

vim.lsp.enable({
  "bashls",
  "csharp_ls",
  "efm",
  "fish_lsp",
  "gopls",
  "lua_ls",
  "nil_ls",
  "pyright",
  "ts_ls",
})
