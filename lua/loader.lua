local M = {}

M.load_packages = function(directory_path)
  local p = vim.fn.stdpath('config') .. directory_path

  local combined_pack = {}
  local combined_load = {}

  local expanded_path = vim.fn.expand(p)

  local pattern = expanded_path:match('/$') and expanded_path .. '*.lua' or expanded_path .. '/*.lua'
  local lua_files = vim.fn.glob(pattern, true, true)

  if type(lua_files) == 'string' then
    if lua_files ~= '' then
      lua_files = { lua_files }
    else
      lua_files = {}
    end
  end

  for _, filepath in ipairs(lua_files) do
    local module = dofile(filepath)

    table.insert(combined_pack, module.pack)
    table.insert(combined_load, module.load)
  end

  return combined_pack, combined_load
end

return M
