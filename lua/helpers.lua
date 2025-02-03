local helpers = {}

helpers.source_vim_file = function(path)
  vim.cmd('source' .. vim.fn.stdpath('config') .. path)
end

helpers.setup_lsp = function(name, lspconfig, capabilities)
  local lsp_setup = require('config.lsp.' .. name)

  lsp_setup.setup(lspconfig, capabilities)
end

helpers.setup_lsp_many = function(names, lspconfig, capabilities)
  for _, x in ipairs(names) do
    helpers.setup_lsp(x, lspconfig, capabilities)
  end
end

return helpers
