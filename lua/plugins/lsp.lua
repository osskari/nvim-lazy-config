return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    depencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'saghen/blink.cmp',
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require('helpers').setup_lsp_many(
        {
          'lua',
          'csharp',
          'js'
        },
        lspconfig,
        capabilities)

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          -- buffer local keybinds
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = event.buf })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition", buffer = event.buf })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = event.buf })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation", buffer = event.buf })
          vim.keymap.set("n", "<leader>go", vim.lsp.buf.type_definition, { desc = "Type definition", buffer = event.buf })
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References", buffer = event.buf })
          vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = event.buf })
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename", buffer = event.buf })
          vim.keymap.set({ "n", "x" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end,
            { desc = "Format", buffer = event.buf })

          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = event.buf })

          vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>",
            { desc = "Search file symbols", buffer = event.buf })
        end,
      })
    end,
  }
}
