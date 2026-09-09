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

-- lua
require("servers.lua")
-- bashls
require("servers.bash")
-- fish
require("servers.fish")
-- go
require("servers.go")
-- python
require("servers.python")
-- typescript
require("servers.typescript")
-- yaml
require("servers.yaml")
-- zig
require("servers.zig")
-- efm
-- TODO: make efm nicer
local req_efm = function (name, type)
  return require("efmls-configs." .. type .. "s." .. name)
end

local prettier = req_efm("prettier", "formatter")
local eslint_d = req_efm("eslint_d", "linter")
local go_revive = req_efm("go_revive", "linter")
local gofumpt = req_efm("gofumpt", "formatter")
local fixjson = req_efm("fixjson", "formatter")
local luacheck = req_efm("luacheck", "linter")
local stylua = req_efm("stylua", "formatter")
local flake8 = req_efm("flake8", "linter")
local black = req_efm("black", "formatter")
local shellcheck = req_efm("shellcheck", "linter")
local shfmt = req_efm("shfmt", "formatter")

local languages = {
  css = {prettier},
  docker = {prettier},
  go = {go_revive, gofumpt},
  html = {prettier},
  javascript = {eslint_d, prettier},
  javascriptreact = {eslint_d, prettier},
  json = {eslint_d, fixjson},
  jsonc = {eslint_d, fixjson},
  lua = {luacheck, stylua},
  markdown = {prettier},
  -- nix = {},
  python = {flake8, black},
  sh = {shellcheck, shfmt},
  typescript = {eslint_d, prettier},
  typescriptreact = {eslint_d, prettier},
  yaml = {prettier},
}

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { ".git/" },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
  }
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("efm", vim.tbl_extend("force", efmls_config, {
  capabilities = capabilities,
}))
vim.lsp.enable("efm")

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
