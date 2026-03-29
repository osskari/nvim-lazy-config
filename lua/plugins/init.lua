return {
  {
    pack = { source = "lumen-oss/lz.n" },
  },
  {
    pack = { source = "catppuccin/nvim", name = "catppuccin" },
    load = {
      "catppuccin",
      after = function()
        vim.cmd.colorscheme("catppuccin-nvim")
      end,
    }
  },
  {
    load = {
      "mini.nvim",
      after = function()
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
      end
    }
  },
  {
    pack = { source = "folke/snacks.nvim" },
    load = {
      "snacks.nvim",
      after = function()
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
      end,
      keys = {
        -- bufdelete
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Close the current buffer" },
        -- explorer
        { "<leader>e", function() Snacks.explorer.open() end, desc = "Open file tree" },
        -- gh
        { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
        -- gitbrowse
        { "<leader>gb", function() Snacks.gitbrowse.open() end, desc = "Open file in remote" }, -- TODO: fix for ssh aliases
        -- lazygit
        { "<leader>lg", function() Snacks.lazygit.open() end, desc = "Open lazygit" },
        -- picker
        { "<leader>ff", function() Snacks.picker.smart() end, desc = "Find files" },
        { "<leader>fG", function() Snacks.picker.grep({ ft = vim.bo.filetype }) end, desc = "grep" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "grep" },
        { "gr", function() Snacks.picker.lsp_references() end, desc = "Go to references" },
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Go to definition" },
      }
    }
  },
  {
    pack = {
      source = "hrsh7th/nvim-cmp",
      depends = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
      },
    },
    load = {
      "nvim-cmp",
      after = function()
        local cmp = require("cmp")

        cmp.setup({

          -- snippet = {
          --   expand = function(args)
          --     -- require('luasnip').lsp_expand(args.body)
          --   end
          -- },

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
      end
    }
  }
}
