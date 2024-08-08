return {
  "tpope/vim-dotenv",
  config = function()
    local env_file = ".env.nvim"
    local f = io.open(env_file, "r")
    if f ~= nil then
      io.close(f)
      vim.cmd('Dotenv .env.nvim')
    end
  end
}
