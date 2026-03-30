return {
  pack = { source = "Aasim-A/scrollEOF.nvim" },
  load = {
    "scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    after = function()
      require("scrollEOF").setup({})
    end,
  },
}
