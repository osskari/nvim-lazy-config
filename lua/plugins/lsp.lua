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

local lsp_utils = require("utils.lsp")
local configured_servers = lsp_utils.load_servers()

-- configure servers in lua/servers
for _, value in ipairs(configured_servers) do
  lsp_utils.configure(value.name, capabilities, value.config)
end

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

    keymap("n", "K", vim.lsp.buf.hover, opts)                    -- hover docs
    keymap("n", "gd", vim.lsp.buf.definition, opts)              -- goto definition
    keymap("n", "gD", vim.lsp.buf.declaration, opts)             -- goto declaration
    keymap("n", "gi", vim.lsp.buf.implementation, opts)          -- goto implementation
    keymap("n", "<leader>go", vim.lsp.buf.type_definition, opts) -- go to type definition
    keymap("n", "<leader>gr", vim.lsp.buf.references, opts)      -- go to references
    keymap("n", "<leader>gs", vim.lsp.buf.signature_help, opts)  -- signature help
    keymap("n", "<leader>cr", vim.lsp.buf.rename, opts)          -- rename symbol
    keymap({ "n", "x" }, "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)                                               -- format buffer
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code action
    keymap("n", "Q", vim.diagnostic.open_float, opts) -- cursor diagnostic
    keymap("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts) -- previous diagnostic
    keymap("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts) -- next diagnostic

    -- fzf binds
    keymap("n", "<leader>fd", "<CMD>FzfLua lsp_finder<CR>", opts)
    keymap("n", "<leader>fr", "<CMD>FzfLua lsp_references<CR>", opts)
    keymap("n", "<leader>ft", "<CMD>FzfLua lsp_typedefs<CR>", opts)
    keymap("n", "<leader>fs", "<CMD>FzfLua lsp_document_symbols<CR>", opts)
    keymap("n", "<leader>fi", "<CMD>FzfLua lsp_implementations<CR>", opts)
  end
  ,
})
