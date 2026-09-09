return {
  name = "bashls",
  servers = {
    "bash-language-server",
    "shellcheck",
    "shfmt",
  },
  config = {
    filetypes = { "sh", "bash", "zsh" },
  },
  efmConfig = {
    sh = {
      linter = "shellcheck",
      formatter = "shfmt",
    },
  },
}
