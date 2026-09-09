local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0

vim.lsp.config["zls"] = {
  capabilities = capabilities,
  cmd = {"zls"},
  filetypes = {"zig"},
  root_markers = {"build.zig"},
}
vim.lsp.enable("zls")

