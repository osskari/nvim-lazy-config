return {
  source_vim_file = function(path)
    vim.cmd('source' .. vim.fn.stdpath('config') .. path)
  end,
}

