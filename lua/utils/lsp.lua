M = {}

M.configure = function(name, config)
  vim.lsp.config[name] = config
  vim.lsp.enable(name)
end

M.req_efm = function(name, type)
  return require("efmls-configs." .. type .. "s." .. name)
end

M.mason_install = function (servers)
  local registry = require("mason-registry")

  for _, server in ipairs(servers) do
    if not registry.is_installed(server) then
      local packageInfo = registry.get_package(server)
      packageInfo:install()
    end
  end
end

return M
