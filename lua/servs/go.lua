return {
  name = "lua_ls",
  servers = {
    "lua-language-server",
    "luacheck",
    "stylua",
  },
  config = {
    filetypes = { "lua" },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
          },
        },
      },
    },
  },
  efmConfig = {
    lua = {
      linter = "luacheck",
      formatter = "stylua",
    },
  },
}
