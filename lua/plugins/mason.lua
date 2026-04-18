local mason = require("mason")
mason.setup()

local servers = {
  -- lua
  "lua-language-server",
  -- go
  "gopls",
  -- nix
  -- "nil_ls", -- only on nix
  -- bash
  "bash-language-server",
  -- fish
  "fish-lsp",
  -- csharp
  "csharp-language-server",
  -- python
  "pyright",
  -- typescript
  "typescript-language-server",
  -- efm
  "prettier",
  "revive",
  "gofumpt",
  "eslint_d",
  "fixjson",
  "luacheck",
  "stylua",
  -- "alejandra", -- nix only
  "flake8",
  "black",
  "shellcheck",
  "shfmt",
}

local masonRegistry = require("mason-registry")

for _, server in ipairs(servers) do
  if not masonRegistry.is_installed(server) then
    local luals = masonRegistry.get_package(server)
    luals:install()
  end
end
