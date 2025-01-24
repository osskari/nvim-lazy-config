return {
  -- {
  --   "folke/tokyonight.nvim",
  --   -- lazy = true,
  --   opts = { style = "moon" },
  --   config = function()
  --     vim.cmd("colorscheme tokyonight")
  --     vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#292e42" })
  --   end,
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   opts = ...,
  --   config = function ()
  --     local gruvbox = require("gruvbox")
  --
  --     gruvbox.setup({})
  --
  --     vim.o.background = "dark"
  --     vim.cmd([[colorscheme gruvbox]])
  --   end
  -- },
  -- Lazy
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function ()
      vim.cmd("colorscheme onedark")
    end
  }

}
