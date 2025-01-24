return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require('nvim-treesitter.configs').setup {
      injections = {
        enable = true,
        sql = {
          highlight = true
        }
      },
      ensure_installed = {
        "lua",
        "c_sharp",
        "javascript",
        "typescript"
      },
      sync_install = false,
      ignore_install = {},
      highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      rainbow = {
        enable = true
      }
    }
  end,
}
