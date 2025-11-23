return function(capabilities)
  local luacheck = require("efmls-configs.linters.luacheck")   -- lua linter
  local stylua = require("efmls-configs.formatters.stylua")    -- lua formatter
  local flake8 = require("efmls-configs.linters.flake8")       -- python linter
  local black = require("efmls-configs.formatters.black")      -- python formatter
  local eslint_d = require("efmls-configs.linters.eslint_d")   -- typescript linter
  local prettier = require("efmls-configs.formatters.prettier") -- typescript formatter
  local fixjson = require("efmls-configs.formatters.fixjson")  -- json formatter
  local shellcheck = require("efmls-configs.linters.shellcheck") -- bash linter
  local shfmt = require("efmls-configs.formatters.shfmt")       -- bash formatter
  local go_revive = require("efmls-configs.linters.go_revive") -- go linter
  local gofumpt = require("efmls-configs.formatters.gofumpt")  -- go formatter
  local alejandra = require("efmls-configs.formatters.alejandra")  -- nix formatter

  vim.lsp.config("efm", {
    capabilities = capabilities,
    filetypes = {
      "css",
      "docker",
      "go",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "nix",
      "python",
      "sh",
      "typescript",
      "typescriptreact",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        css = { prettier },
        docker = { prettier },
        go = { gofumpt, go_revive },
        html = { prettier },
        javascript = { eslint_d, prettier },
        javascriptreact = { eslint_d, prettier },
        json = { eslint_d, fixjson },
        jsonc = { eslint_d, fixjson },
        lua = { luacheck, stylua },
        markdown = { prettier },
        nix = { alejandra },
        python = { flake8, black },
        sh = { shellcheck, shfmt },
        typescript = { eslint_d, prettier },
        typescriptreact = { eslint_d, prettier },
      },
    },
  })
end
