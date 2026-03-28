return {
  pack = "nvim-mini/mini.pairs",
  load = {
    "mini.pairs",
    after = function()
      require('mini.pairs').setup()
    end,
  },
}
