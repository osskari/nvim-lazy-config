return {
  "nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  lazy = false,
  after = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup({
        install_dir = vim.fn.stdpath("data") .. "/site"
    })

    local parsers = {
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
    }

    treesitter.install(parsers)
    treesitter.update(parsers)
  end,
}
