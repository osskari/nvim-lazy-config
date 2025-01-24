return {
  setup = function (lspconfig, capabilities)
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })
  end
}
