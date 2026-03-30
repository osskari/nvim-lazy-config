return {
  pack = { source = "folke/snacks.nvim" },
  load = {
    "snacks.nvim",
    lazy = false,
    after = function()
      require("snacks").setup({
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        debug = { enabled = true },
        explorer = { enabled = true },
        gh = { enabled = true },
        gitbrowse = { enabled = true },
        image = { enabled = true },
        lazygit = { enabled = true },
        picker = {
          enabled = false,
          win = {
            input = {
              keys = {
                ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
              },
            },
          },
        },
        quickfile = { enabled = true },
      })
    end,
    keys = {
      -- bufdelete
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "Close the current buffer",
      },
      -- explorer
      {
        "<leader>e",
        function()
          Snacks.explorer.open()
        end,
        desc = "Open file tree",
      },
      -- gh
      {
        "<leader>gp",
        function()
          Snacks.picker.gh_pr()
        end,
        desc = "GitHub Pull Requests (open)",
      },
      -- gitbrowse
      {
        "<leader>gb",
        function()
          Snacks.gitbrowse.open()
        end,
        desc = "Open file in remote",
      }, -- TODO: fix for ssh aliases
      -- lazygit
      {
        "<leader>lg",
        function()
          Snacks.lazygit.open()
        end,
        desc = "Open lazygit",
      },
    },
  },
}
