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
