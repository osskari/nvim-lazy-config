local utils = require("utils.efm")

local dependencies = {
  css = {
    formatter = "prettier",
  },
  docker = {
    formatter = "prettier",
  },
  go = {
    linter = "go_revive",
    formatter = "gofumpt",
  },
  html = {
    formatter = "prettier",
  },
  javascript = {
    linter = "eslint_d",
    formatter = "prettier",
  },
  javascriptreact = {
    linter = "eslint_d",
    formatter = "prettier",
  },
  json = {
    linter = "eslint_d",
    formatter = "fixjson",
  },
  jsonc = {
    linter = "eslint_d",
    formatter = "fixjson",
  },
  lua = {
    linter = "luacheck",
    formatter = "stylua",
  },
  markdown = {
    formatter = "prettier",
  },
  nix = {
    formatter = "alejandra",
  },
  python = {
    linter = "flake8",
    formatter = "black",
  },
  sh = {
    linter = "shellcheck",
    formatter = "shfmt",
  },
  typescript = {
    linter = "eslint_d",
    formatter = "prettier",
  },
  typescriptreact = {
    linter = "eslint_d",
    formatter = "prettier",
  },
}

return {
  name = "efm",
  config = {
    filetypes = utils.efm_file_types(dependencies),
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = utils.efm_configure_languages(dependencies),
    },
  },
}
