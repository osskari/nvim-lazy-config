local req_efm = function(name, type)
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
  css = { prettier },
  docker = { prettier },
  go = { go_revive, gofumpt },
  html = { prettier },
  javascript = { eslint_d, prettier },
  javascriptreact = { eslint_d, prettier },
  json = { eslint_d, fixjson },
  jsonc = { eslint_d, fixjson },
  lua = { luacheck, stylua },
  markdown = { prettier },
  python = { flake8, black },
  sh = { shellcheck, shfmt },
  typescript = { eslint_d, prettier },
  typescriptreact = { eslint_d, prettier },
  yaml = { prettier },
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
  },
}

vim.lsp.config("efm", efmls_config)
vim.lsp.enable("efm")
