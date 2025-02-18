return {
  setup = function(lspconfig, capabilities)
    lspconfig.pylsp.setup({
      capabilities = capabilities,
    })
  end
}
