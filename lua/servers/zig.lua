vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0

require("utils.lsp").configure("zls", {
  cmd = {"zls"},
  filetypes = {"zig"},
  root_markers = {"build.zig"},
})
