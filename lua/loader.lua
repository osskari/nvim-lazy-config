vim.loader.enable()

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local kind = ev.data.kind
    local path = ev.data.path
    local name = ev.data.spec.name

    if kind == "install" or kind == "update" then
      vim.loader.reset(path)
    end

    vim.notify(("vim.loader reset for %s (%s)"):format(name, kind))
  end,
})
