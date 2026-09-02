vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      -- todo why is the health check saying there is nothing
      vim.fn.system("make install_jsregexp")
    end
  end
})

local packs = {
  -- luasnip
  "https://github.com/L3MON4D3/LuaSnip",

  -- cmp
  "https://github.com/hrsh7th/nvim-cmp",
  -- deps
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/saadparwaiz1/cmp_luasnip",

  -- lsp
  "https://github.com/neovim/nvim-lspconfig",
  -- deps
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/creativenull/efmls-configs-nvim",

  -- mini
  "https://github.com/nvim-mini/mini.ai",
  "https://github.com/nvim-mini/mini.comment",
  "https://github.com/nvim-mini/mini.pairs",
  "https://github.com/nvim-mini/mini.splitjoin",
  "https://github.com/nvim-mini/mini.surround",
  "https://github.com/nvim-mini/mini.bufremove",
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-mini/mini.trailspace",

  -- snacks
  "https://github.com/folke/snacks.nvim",

  -- trouble
  "https://github.com/folke/trouble.nvim",

  -- fzf-lua
  "https://github.com/ibhagwan/fzf-lua",

  -- harpoon
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  -- deps
  "https://github.com/nvim-lua/plenary.nvim",

  -- lualine
  "https://github.com/nvim-lualine/lualine.nvim",

  -- startuptime
  "https://github.com/dstein64/vim-startuptime",

  -- gitsigns
  "https://github.com/lewis6991/gitsigns.nvim",

  -- scrollEOF
  "https://github.com/Aasim-A/scrollEOF.nvim",

  -- treesitter
  "https://github.com/nvim-treesitter/nvim-treesitter",

  -- colorscheme
  { src = "https://github.com/catppuccin/nvim",      name = "catppuccin" },

  -- vimtmuxnavigator
  "https://github.com/christoomey/vim-tmux-navigator",

  -- easydotnet
  "https://github.com/GustavEikaas/easy-dotnet.nvim",
  "https://github.com/mfussenegger/nvim-dap",

  -- zig
  "https://codeberg.org/ziglang/zig.vim",

  -- rust
  {
    src = "https://github.com/mrcjkb/rustaceanvim",
    version = vim.version.range('^9')
  },
}

vim.pack.add(packs)
