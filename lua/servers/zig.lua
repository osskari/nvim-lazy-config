vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0

return {
  name = "zls",
  config = {
    cmd = {"zls"},
    filetypes = {"zig"},
    root_markers = {"build.zig"},
  },
}
