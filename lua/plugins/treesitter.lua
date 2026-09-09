-- add deps
vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})

-- config
local treesitter = require("nvim-treesitter")

treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

treesitter.install({
  "bash",
  "c",
  "css",
  "c_sharp",
  "dockerfile",
  "fish",
  "go",
  "html",
  "javascript",
  "json",
  "kdl",
  "lua",
  "markdown",
  "markdown_inline",
  "nix",
  "python",
  "rust",
  "sql",
  "tsx",
  "typescript",
  "yaml",
  "zig",
})
