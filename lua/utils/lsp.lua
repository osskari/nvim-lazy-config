local M = {}

M.on_attach = function(client, bufnr)
  local keymap = vim.keymap.set

  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }

  keymap("n", "K", vim.lsp.buf.hover, opts) -- hover docs
  keymap("n", "gd", vim.lsp.buf.definition, opts) -- goto definition
  keymap("n", "gD", vim.lsp.buf.declaration, opts) -- goto declaration
  keymap("n", "gi", vim.lsp.buf.implementation, opts) -- goto implementation
  keymap("n", "<leader>go", vim.lsp.buf.type_definition, opts) -- go to type definition
  keymap("n", "<leader>gr", vim.lsp.buf.references, opts) -- go to references
  keymap("n", "<leader>gs", vim.lsp.buf.signature_help, opts) -- signature help
  keymap("n", "<leader>cr", vim.lsp.buf.rename, opts) -- rename symbol
  keymap({ "n", "x" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts) -- format buffer
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code action
  keymap("n", "<leader>D", function() vim.diagnostic.openfloat({scope = 'line'}) end, opts) -- line diagnostic
  -- keymap("n", "<leader>d", vim.diagnostic.openfloat, opts) -- cursor diagnostic
  keymap("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, opts) -- previous diagnostic
  keymap("n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end, opts) -- next diagnostic

  -- fzf binds
  keymap("n", "<leader>fd", "<CMD>FzfLua lsp_finder<CR>", opts)
  keymap("n", "<leader>fr", "<CMD>FzfLua lsp_references<CR>", opts)
  keymap("n", "<leader>ft", "<CMD>FzfLua lsp_typedefs<CR>", opts)
  keymap("n", "<leader>fs", "<CMD>FzfLua lsp_document_symbols<CR>", opts)
  keymap("n", "<leader>fi", "<CMD>FzfLua lsp_implementations<CR>", opts)
end

return M;
