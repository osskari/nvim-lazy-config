return {
  "williamboman/mason.nvim",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    -- Global keybinds
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic menu" })

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        -- buffer local keybinds
        vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover", buffer = event.buf })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition", buffer = event.buf })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Definition", buffer = event.buf })
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = event.buf })
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Implementation", buffer = event.buf })
        vim.keymap.set("n", "<leader>go", vim.lsp.buf.type_definition, { desc = "Type definition", buffer = event.buf })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References", buffer = event.buf })
        vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = event.buf })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename", buffer = event.buf })
        vim.keymap.set({ "n", "x" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end,
          { desc = "Format", buffer = event.buf })

        -- Format and save
        vim.keymap.set("n", "<leader>ww", function()
          vim.lsp.buf.format({ async = true })
          vim.cmd('w')
        end, { desc = "Save current buffer and format file" })
        vim.keymap.set("n", "<leader>wa", function()
          vim.lsp.buf.format({ async = true })
          vim.cmd('Wall')
        end, { desc = "Save all open buffers and format" })

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = event.buf })

        vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>",
          { desc = "Search file symbols", buffer = event.buf })
      end,
    })

    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    local default_setup = function(server)
      require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
      })
    end

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {},
      handlers = {
        default_setup,
      },
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })
  end,
}
