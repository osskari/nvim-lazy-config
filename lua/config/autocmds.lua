-- ================================================================================================
-- TITLE : auto-commands
-- ABOUT : automatically run code on defined events (e.g. save, yank)
-- ================================================================================================

local function augroup(name)
  return vim.api.nvim_create_augroup("osskari_" .. name, { clear = true })
end

-- reload file when changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Restore last cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("LastCursorGroup"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Highlight the yanked text for 200ms
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("HighlightYank"),
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- resize splits if window resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Dynamic colorcolumn
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("big_colorcolumn"),
  pattern = { "cs" },
  callback = function()
    vim.opt_local.colorcolumn = "120"
  end,
})

-- local on_attach = require("utils.lsp").on_attach
-- -- on attach function shortcuts
-- local lsp_on_attach_group = vim.api.nvim_create_augroup("LspMappings", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = lsp_on_attach_group,
-- 	callback = on_attach,
-- })
