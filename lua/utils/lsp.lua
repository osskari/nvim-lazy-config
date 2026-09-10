M = {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

M.configure = function(name, config)
  config["capabilities"] = capabilities

vim.lsp.config[name] = config
vim.lsp.enable(name)
end

return M
