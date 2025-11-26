local M = {}

-- ----------------------------------------------------------------------------------------
-- Info: Add efm dependencies here.
-- Prerequisites:
--   - The config has to exist in efmls-configs.[key]s.[value]
--   - The dependency needs to be installed on the machine
-- ----------------------------------------------------------------------------------------
local dependencies = {
  css = {
    formatter = 'prettier',
  },
  docker = {
    formatter = 'prettier',
  },
  go = {
    linter = 'go_revive',
    formatter = 'gofumpt',
  },
  html = {
    formatter = 'prettier',
  },
  javascript = {
    linter = 'eslint_d',
    formatter = 'prettier',
  },
  javascriptreact = {
    linter = 'eslint_d',
    formatter = 'prettier',
  },
  json = {
    linter = 'eslint_d',
    formatter = 'fixjson',
  },
  jsonc = {
    linter = 'eslint_d',
    formatter = 'fixjson',
  },
  lua = {
    linter = 'luacheck',
    formatter = 'stylua',
  },
  markdown = {
    formatter = 'prettier',
  },
  nix = {
    formatter = 'alejandra',
  },
  python = {
    linter = 'flake8',
    formatter = 'black',
  },
  sh = {
    linter = 'shellcheck',
    formatter = 'shfmt',
  },
  typescript = {
    linter = 'eslint_d',
    formatter = 'prettier',
  },
  typescriptreact = {
    linter = 'eslint_d',
    formatter = 'prettier',
  },
}

local init_options = {
  documentFormatting = true,
  documentRangeFormatting = true,
  hover = true,
  documentSymbol = true,
  codeAction = true,
  completion = true,
}

M.config = function(capabilities)
  local utils = require('utils.efm')

  vim.lsp.config("efm", {
    capabilities = capabilities,
    filetypes = utils.file_types(dependencies),
    init_options = init_options,
    settings = {
      languages = utils.configure_languages(dependencies),
    },
  })
end

return M
