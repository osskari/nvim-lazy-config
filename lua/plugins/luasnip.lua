return {
  pack = {
    source = "L3MON4D3/LuaSnip",
    hooks = {
      post_install = function()
        vim.fn.system("make install_jsregexp")
      end,
    }
  }
}
