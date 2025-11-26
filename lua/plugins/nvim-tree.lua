return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

    nvimtree.setup({
      filters = {
        dotfiles = false, -- show dotfiles
      },
      view = {
        adaptive_size = true,
      },
    })

    local api = require("nvim-tree.api")

    vim.keymap.set('n', '<leader>ee', '<CMD>NvimTreeToggle<CR>')
    vim.keymap.set('n', '<leader>ef', function()
      if (not api.tree.is_visible() or not vim.fn.expand('%'):match('^NvimTree_*')) then
        api.tree.open({ find_file = true })
        return
      end

      local previous_file = vim.fn.expand('#'):match("([^/\\]+)$")

      if (previous_file == nil or api.tree.get_node_under_cursor().name == previous_file) then
        api.tree.close()
      else
        api.tree.find_file({ buf = vim.fn.bufnr('#') })
      end
    end)
  end
}
