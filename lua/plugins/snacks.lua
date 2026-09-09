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
  terminal = {
    enabled = true,
    win = {
      style = "terminal",
      position = "float",
      border = "rounded",
      height = 0.8,
      width = 0.8,
    },
  },
  quickfile = { enabled = true },
})

vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Close the current buffer" })
vim.keymap.set("n", "<leader>e", function() Snacks.explorer.open() end, { desc = "Open file tree" })
vim.keymap.set("n", "<leader>gp", function() Snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
vim.keymap.set("n", "<leader>gb", function() Snacks.gitbrowse.open() end, { desc = "Open file in remote" })-- TODO: fix for ssh aliases
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit.open() end, { desc = "Open lazygit" })
vim.keymap.set({ "n", "t" }, "<c-t>", function() Snacks.terminal.toggle(nil, { cwd = Snacks.git.get_root() }) end, { desc = "Toggle terminal" })
