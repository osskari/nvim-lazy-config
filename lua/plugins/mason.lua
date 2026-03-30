if require("utils.nix").isNix() then
  return {}
end

return {
  pack = {
    source = "mason-org/mason.nvim",
  },
  load = {
    "mason.nvim",
    after = function()
      require("mason").setup()
    end,
  },
}
