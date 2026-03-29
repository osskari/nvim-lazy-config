return {
  pack = {
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  },
  load = {
    "nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    after = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      require("nvim-treesitter").install({
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
        "zig",
      })
    end,
  },
}
