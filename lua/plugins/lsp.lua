local utils = require("utils")

local depends = {
  "creativenull/efmls-configs-nvim"
}

if not utils.isNix() then
  table.insert(depends, "mason-org/mason.nvim")
end

return {
  pack = {
    source = "neovim/nvim-lspconfig",
    depends = depends,
  },
  load = {
    "nvim-lspconfig",
    event = "BufReadPre",
    after = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          }
        }
      })

      -- LUA
      vim.lsp.config["lua_ls"] = {
        capabilities = capabilities,
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
              }
            }
          }
        }
      }
      vim.lsp.enable("lua_ls")

      -- EFM
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

      vim.lsp.config["efm"] = {
        capabilities = capabilities,
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
      }
      vim.lsp.enable("efm")
    end
  },
}
