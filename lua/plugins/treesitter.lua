return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
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
        "tmux",
        "tsx",
        "typescript",
        "yaml",
        "zig"
      },
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<TAB>",
          node_decremental = "<S-TAB>"
        },
      },
    })
  end,
}
