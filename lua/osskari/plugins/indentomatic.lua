return {
  'Darazaki/indent-o-matic',
  config = function()
    require('indent-o-matic').setup {
      standard_widths = { 2, 4, 8 },

      filetype_lua = {
        standard_widths = { 2 },
      },

      filetype_c = {
        standard_widths = { 2 },
      },
    }
  end,
}
