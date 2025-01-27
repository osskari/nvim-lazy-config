return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "vimdoc", "javascript", "typescript", "c" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.fsharp = {
			install_info = {
				url = 'https://github.com/ionide/tree-sitter-fsharp',
				branch = 'main',
				files = { 'src/scanner.c', 'src/parser.c' },
				location = 'fsharp'
			},
			requires_generate_from_grammar = false,
			filetype = 'fsharp',
		}
	end,
}
