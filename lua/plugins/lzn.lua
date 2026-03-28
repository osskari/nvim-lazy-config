return {
  pack = {
    "lumen-oss/lz.n",
    build = function()
      require("lz.n").load("plugins")
    end,
  }
}
