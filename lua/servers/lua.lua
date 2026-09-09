local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config["lua_ls"] = {
  capabilities = capabilities,
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
}
vim.lsp.enable("lua_ls")
