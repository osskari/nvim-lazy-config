require("opts")
require("keymap")
require("autocmd")

require("deps")

MiniDeps.add({ source = "catppuccin/nvim", name = "catppuccin" })
require("colorscheme")

-- mini things
-- ai
require("mini.ai").setup({})
-- comment
require("mini.comment").setup({})
-- autopairs
require("mini.pairs").setup({})
-- splitjoin
require("mini.splitjoin").setup({})
-- surround
require("mini.surround").setup({})
-- bufremove
require("mini.bufremove").setup({})
-- icons
require("mini.icons").setup({})
-- trailspace
require("mini.trailspace").setup({})

-- snacks things
MiniDeps.add({ source = "folke/snacks.nvim" })

require("snacks").setup({
  bigfile = { enabled = true },
  bufdelete = { enabled = true },
  debug = { enabled = true },
  explorer = { enabled = true },
  gh = { enabled = true, },
  gitbrowse = { enabled = true },
  image = { enabled = true },
  lazygit = { enabled = true },
  picker = {
    enabled = true,
    win = {
      input = {
        keys = {
          ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
          ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
        }
      }
    }
  },
  quickfile = { enabled = true },
})
-- bufdelete
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Close the current buffer" })
-- explorer
vim.keymap.set("n", "<leader>e", function() Snacks.explorer.open() end, { desc = "Open file tree" })
-- gh
vim.keymap.set("n", "<leader>gp", function() Snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
-- gitbrowse
vim.keymap.set("n", "<leader>gb", function() Snacks.gitbrowse.open() end, { desc = "Open file in remote" }) -- TODO: fix for ssh aliases
-- lazygit
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit.open() end, { desc = "Open lazygit" })
-- picker
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.smart() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fG", function() Snacks.picker.grep({ ft = vim.bo.filetype }) end, { desc = "grep" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "grep" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "Go to references" })
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Go to definition" })

-- cmp

-- lsp
