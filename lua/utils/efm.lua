local M = {}

M.file_types = function(dependencies)
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
    requires[value] = require('efmls-configs.' .. key .. 's.' .. value)
  end

  return requires
end

M.configure_languages = function(dependencies)
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
