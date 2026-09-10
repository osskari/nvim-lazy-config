require("utils.lsp").configure("ts_ls", {
  filetypes = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
  },
  settings = {
    typescript = {
      indentStyle = "space",
      intentSize = 2,
    },
  }
})
