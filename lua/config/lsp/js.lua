return {
  setup = function (lspconfig, capabilities)
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern("package.json"),
      single_file_support = false,
    })

    lspconfig.denols.setup({
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
    })
  end
}
