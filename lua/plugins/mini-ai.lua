return {
  pack = "nvim-mini/mini.ai",
  load = {
    "mini.ai",
    after = function()
      require('mini.ai').setup()
    end,
  },
}
