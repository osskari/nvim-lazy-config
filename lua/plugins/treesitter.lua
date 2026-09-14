-- add deps
vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })

-- config
require("tree-sitter-manager").setup({
  ensure_installed = {
    -- "bash",
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
    -- "lua",
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
  },
})
