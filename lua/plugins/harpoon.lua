return {
  pack = {
    source = "ThePrimeagen/harpoon",
    checkout = "harpoon2",
    depends = { "nvim-lua/plenary.nvim" },
  },
  load = {
    "harpoon",
    after = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<leader>hh", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<leader>hp", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():next()
      end)
    end,
  },
}
