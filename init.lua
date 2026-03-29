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
MiniDeps.add({
  source = "hrsh7th/nvim-cmp",
  depends = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    {
      source = "L3MON4D3/LuaSnip",
      checkout = "v2.4.1",
      hooks = {
        post_install = function(spec)
          vim.fn.system({"make", "install_jsregexp"}, {cwd = spec.path})
        end
      }
    },
  },
})
local cmp = require("cmp")

cmp.setup({

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<TAB>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_signature_help" },
  },
})

-- lsp
