local config = {

  bash = {
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
  },

  csharp = {
    name = "csharp_ls",
    servers = {
      "csharp-language-server",
    },
  },

  -- efm = {
  --   name = "efm",
  --   servers = {
  --     "efm",
  --   },
  --   config = {
  --     filetypes = utils.efm_file_types(dependencies),
  --     init_options = {
  --       documentFormatting = true,
  --       documentRangeFormatting = true,
  --       hover = true,
  --       documentSymbol = true,
  --       codeAction = true,
  --       completion = true,
  --     },
  --     settings = {
  --       languages = utils.efm_configure_languages(dependencies),
  --     },
  --   },
  -- },

  fish = {
    name = "fish_lsp",
    servers = {
      "fish-lsp",
    },
  },

  go = {
    name = "gopls",
    servers = {
      "gopls",
      "go_revive",
      "gofumpt",
    },
    config = {
      filetypes = { "go" },
    },
    efmConfig = {
      go = {
        linter = "go_revive",
        formatter = "gofumpt",
      },
    },
  },

  lua = {
    name = "lua_ls",
    servers = {
      "lua-language-server",
      "luacheck",
      "stylua",
    },
    config = {
      filetypes = { "lua" },
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              vim.fn.expand("$VIMRUNTIME/lua"),
              vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
            },
          },
        },
      },
    },
    efmConfig = {
      lua = {
        linter = "luacheck",
        formatter = "stylua",
      },
    },
  },

  nix = {
    skip = true,
    name = "nil_ls",
    servers = {
      "nil_ls",
      "alejandra",
    },
    efmConfig = {
      nix = {
        formatter = "alejandra",
      },
    },
  },

  python = {
    name = "pyright",
    servers = {
      "pyright",
      "flake8",
      "black",
    },
    config = {
      filetypes = { "python" },
      settings = {
        pyright = {
          disableOrganizeImports = false,
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
            autoImportCompletions = true,
          },
        },
      },
    },
    efmConfig = {
      python = {
        linter = "flake8",
        formatter = "black",
      },
    },
  },

  typescript = {
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
  },
}

return config
