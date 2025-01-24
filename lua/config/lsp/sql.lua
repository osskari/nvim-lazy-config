return {
  setup = function (lspconfig, capabilities, sqls)
    lspconfig.sqls.setup({
      capabilities = capabilities,
      on_attach = function (client, bufnr)
        sqls.on_attach(client, bufnr)
      end,
      settings = {
        sqls = {
          connections = {
            {
              driver = 'postgresql',
              dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=secret123 dbname=vedur sslmode=disable'
            },
          }
        }
      }
    })
  end
}
