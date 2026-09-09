-- add deps
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  -- deps
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/creativenull/efmls-configs-nvim",
  -- fzf lsp binds
  "https://github.com/ibhagwan/fzf-lua",
})

-- config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
})

-- TODO: move server configs
vim.lsp.config["lua_ls"] = {
  capabilities = capabilities,
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$HOME/config") .. "/nvim/lua",
        },
      },
    },
  },
}

vim.lsp.enable("lua_ls")
-- local lsp_utils = require("utils.lsp")
-- local configured_servers = lsp_utils.load_servers()
-- configure servers in lua/servers
-- for _, value in ipairs(configured_servers) do
--   lsp_utils.configure(value.name, capabilities, value.config)
-- end


-- set up lsp attach bindings
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspMappings", {}),
  callback = function(ev)
    local keymap = vim.keymap.set
    local bufnr = ev.buf

    local opts = {
      noremap = true,
      silent = true,
      buffer = bufnr,
    }

    keymap("n", "K", vim.lsp.buf.hover, opts)                                                     -- hover docs
    keymap("n", "gd", vim.lsp.buf.definition, opts)                                               -- goto definition
    keymap("n", "gD", vim.lsp.buf.declaration, opts)                                              -- goto declaration
    keymap("n", "gi", vim.lsp.buf.implementation, opts)                                           -- goto implementation
    keymap("n", "<leader>go", vim.lsp.buf.type_definition, opts)                                  -- go to type definition
    keymap("n", "<leader>gr", vim.lsp.buf.references, opts)                                       -- go to references
    keymap("n", "<leader>gs", vim.lsp.buf.signature_help, opts)                                   -- signature help
    keymap("n", "<leader>cr", vim.lsp.buf.rename, opts)                                           -- rename symbol
    keymap({ "n", "x" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts) -- format buffer
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)                                      -- code action
    keymap("n", "Q", vim.diagnostic.open_float, opts)                                             -- cursor diagnostic
    keymap("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)     -- previous diagnostic
    keymap("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)      -- next diagnostic

    -- fzf binds
    local fzf = require("fzf-lua")
    keymap("n", "<leader>fd", fzf.lsp_finder, opts)
    keymap("n", "<leader>fr", fzf.lsp_references, opts)
    keymap("n", "<leader>ft", fzf.lsp_typedefs, opts)
    keymap("n", "<leader>fs", fzf.lsp_document_symbols, opts)
    keymap("n", "<leader>fS", fzf.lsp_workspace_symbols)
    keymap("n", "<leader>fi", fzf.lsp_implementations, opts)
  end
  ,
})
