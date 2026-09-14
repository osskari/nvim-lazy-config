M = {}

--- @param dir string path relative from lua/
M.require_all = function(dir)
  local base = vim.fn.stdpath("config") .. "/lua/" .. dir

  local modnames = vim.iter(vim.fs.dir(base, { depth = 0 }))
      :filter(function(name, type)
        return type == "file" and name:match(".lua") and name ~= "init.lua"
      end)
      :map(function(name)
        -- strip extension and swap / with .
        local rel = (dir .. "/" .. name):gsub("%.lua$", ""):gsub("/", ".")
        return rel
      end)
      :totable()

  table.sort(modnames)

  for _, modname in ipairs(modnames) do
    local ok, err = pcall(require, modname)
    if not ok then
      vim.notify(("Error loading %s: %s"):format(modname, err), vim.log.levels.ERROR)
    end
  end
end

M.ensure_treesitter_installed = function(filetype)
  local queries_path = vim.fn.stdpath('data') .. '/site/queries'

  for name, type in vim.fs.dir(queries_path) do
    if type == "directory" or type == "link" then
      if name:match(filetype) then
        return
      end
    end
  end

  require("tree-sitter-manager")._install_single(filetype)
end

return M
