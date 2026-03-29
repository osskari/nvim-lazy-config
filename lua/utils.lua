local M = {}

M.isNix = function()
  return vim.fn.isdirectory("/nix") == 1
end

local function getConfig()
  local modules = {}

  local expanded_path = vim.fn.expand(vim.fn.stdpath("config") .. "/lua/plugins")

  local pattern = expanded_path:match("/$") and expanded_path .. "*.lua" or expanded_path .. "/*.lua"
  local lua_files = vim.fn.glob(pattern, true, true)

  if type(lua_files) == "string" then
    if lua_files ~= "" then
      lua_files = { lua_files }
    else
      lua_files = {}
    end
  end

  for _, filepath in ipairs(lua_files) do
    local module = dofile(filepath)

    table.insert(modules, module)
  end

  return modules
end

M.loadDependencies = function()
  local packs = {}

  local plugins = getConfig()

  for _, v in ipairs(plugins) do
    table.insert(packs, v.pack)
  end

  return packs
end

M.loadConfig = function()
  local configs = {}

  local plugins = getConfig()

  for _, v in ipairs(plugins) do
    table.insert(configs, v.load)
  end

  return configs
end

M.lsp_on_attach = function(client, bufnr)
  local keymap = vim.keymap.set

  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }

  keymap("n", "K", vim.lsp.buf.hover, opts)                   -- hover docs
  keymap("n", "gd", vim.lsp.buf.definition, opts)             -- goto definition
  keymap("n", "gD", vim.lsp.buf.declaration, opts)            -- goto declaration
  keymap("n", "gi", vim.lsp.buf.implementation, opts)         -- goto implementation
  keymap("n", "<leader>go", vim.lsp.buf.type_definition, opts) -- go to type definition
  keymap("n", "<leader>gr", vim.lsp.buf.references, opts)     -- go to references
  keymap("n", "<leader>gs", vim.lsp.buf.signature_help, opts) -- signature help
  keymap("n", "<leader>cr", vim.lsp.buf.rename, opts)         -- rename symbol
  keymap({ "n", "x" }, "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, opts)                                              -- format buffer
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code action
  keymap("n", "<leader>D", function()
    vim.diagnostic.openfloat({ scope = "line" })
  end, opts) -- line diagnostic
  -- keymap("n", "<leader>d", vim.diagnostic.openfloat, opts) -- cursor diagnostic
  keymap("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, opts) -- previous diagnostic
  keymap("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, opts) -- next diagnostic

  -- fzf binds
  keymap("n", "<leader>fd", "<CMD>FzfLua lsp_finder<CR>", opts)
  keymap("n", "<leader>fr", "<CMD>FzfLua lsp_references<CR>", opts)
  keymap("n", "<leader>ft", "<CMD>FzfLua lsp_typedefs<CR>", opts)
  keymap("n", "<leader>fs", "<CMD>FzfLua lsp_document_symbols<CR>", opts)
  keymap("n", "<leader>fi", "<CMD>FzfLua lsp_implementations<CR>", opts)
end

M.efm_file_types = function(dependencies)
  local types = {}

  for k, _ in pairs(dependencies) do
    table.insert(types, k)
  end

  return types
end

local require_dependencies = function(dependencies)
  local unique_pairs = {}

  for _, tools in pairs(dependencies) do
    for key, value in pairs(tools) do
      unique_pairs[value] = key
    end
  end

  local requires = {}

  for value, key in pairs(unique_pairs) do
    requires[value] = require("efmls-configs." .. key .. "s." .. value)
  end

  return requires
end

M.efm_configure_languages = function(dependencies)
  local config = require_dependencies(dependencies)

  local languages = {}

  for language, configs in pairs(dependencies) do
    languages[language] = {}

    for _, v in pairs(configs) do
      table.insert(languages[language], config[v])
    end
  end

  return languages
end

return M
