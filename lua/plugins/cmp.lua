-- add deps
-- -- add luasnip first
vim.pack.add({
  "https://github.com/L3MON4D3/LuaSnip",
})
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      vim.fn.system("make install_jsregexp")
    end
  end
})

-- -- add cmp and it's deps
vim.pack.add({
  "https://github.com/hrsh7th/nvim-cmp",
  -- deps
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/saadparwaiz1/cmp_luasnip",
})

-- config
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
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
