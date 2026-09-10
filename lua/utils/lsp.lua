M = {}

M.configure = function(name, config)
  vim.lsp.config[name] = config
  vim.lsp.enable(name)
end

return M
