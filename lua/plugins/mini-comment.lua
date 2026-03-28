return {
  pack = "nvim-mini/mini.comment",
  load = {
    "mini.comment",
    after = function()
      require('mini.comment').setup()
    end,
  },
}
