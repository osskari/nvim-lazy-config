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
        vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { desc = "Open diagnostic menu" })

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = { buffer = event.buf }

                -- buffer local keybinds
                vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>go", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
                vim.keymap.set({"n", "x"}, "<leader>cf", function() vim.lsp.buf.format({async = true}) end, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
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

        cmp.setup({
            sources = {
                {name = "nvim_lsp"},
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({select = false}),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })
    end,
}
