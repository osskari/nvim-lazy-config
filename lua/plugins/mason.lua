-- add deps
vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/creativenull/efmls-configs-nvim",
})

-- config
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
  "efm",
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

local registry = require("mason-registry")

registry.refresh(function ()
  for _, server in ipairs(servers) do
    if not registry.is_installed(server) then
      local packageInfo = registry.get_package(server)
      packageInfo:install()
    end
  end
end)
