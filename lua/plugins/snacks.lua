return {
  "snacks.nvim",
  priority = 1000,
  lazy = false,
  after = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      explorer = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        win = {
          input = {
            keys = {
              ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
              ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            },
          }
        },
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          sort_empty = false,
          filename_bonus = true,
          file_pos = true,
          cwd_bonus = true,
          history_bonus = true,
        },
      },
      quickfile = { enabled = true },
    })
  end,
  keys = {
    -- bufdelete
    { "<leader>bd", function() Snacks.bufdelete.delete() end, desc = "Close current buffer" },

    -- explorer
    { "<leader>e", function() Snacks.explorer.open() end, desc = "Toggle file explorer" },

    -- gitbrowse
    { "<leader>gb", function() Snacks.gtibrowse.open() end, desc = "Browse remote file" },

    -- lazygit
    { "<leader>lg", function() Snacks.lazygit.open() end, desc = "Open lazygit" },

    -- picker
    { "<leader>ff", function() Snacks.picker.smart() end, desc = "Find Files" },
    { "<leader>fo", function() Snacks.picker.recent() end, desc = "Find Recent Files" },
    { "<leader>fG", function() Snacks.picker.grep({ ft = vim.bo.filetype }) end, desc = "grep" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "grep" },
    { "gr",         function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gd",         function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
  }
}
