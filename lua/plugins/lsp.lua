local depends = {
  "creativenull/efmls-configs-nvim",
}

if not require("utils.nix").isNix() then
  table.insert(depends, "mason-org/mason.nvim")
end

return {
  pack = {
    source = "neovim/nvim-lspconfig",
    depends = depends,
  },
  load = {
    "nvim-lspconfig",
    event = "BufReadPre",
    after = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      })

      local lsp_utils = require("utils.lsp")
      local servers = lsp_utils.load_servers()

      for _, value in ipairs(servers) do
        lsp_utils.configure(value.name, capabilities, value.config)
      end
    end,
  },
}
