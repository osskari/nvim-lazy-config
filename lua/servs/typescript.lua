return {
  name = "ts_ls",
  servers = {
    "typescript-language-server",
    "eslint_d",
    "prettier",
    "fixjson",
  },
  config = {
    filetypes = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    },
    settings = {
      typescript = {
        indentStyle = "space",
        intentSize = 2,
      },
    },
  },
  efmConfig = {
    docker = {
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
    typescript = {
      linter = "eslint_d",
      formatter = "prettier",
    },
    typescriptreact = {
      linter = "eslint_d",
      formatter = "prettier",
    },
    css = {
      formatter = "prettier",
    },
    html = {
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
    markdown = {
      formatter = "prettier",
    },
  },
}
