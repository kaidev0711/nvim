local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
		"windwp/nvim-ts-autotag",
		"HiPhish/nvim-ts-rainbow2",
	},
}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"lua",
			"c",
			"dockerfile",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"go",
			"gomod",
			"gowork",
			"gosum",
			"typescript",
			"tsx",
			"javascript",
			"html",
			"css",
			"json",
			"python",
			"yaml",
			"vim",
			"vimdoc",
		}, -- put the language you want in this array
		-- ensure_installed = "all", -- one of "all" or a list of languages
		ignore_install = { "" }, -- List of parsers to ignore installing
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "css" }, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		autotag = {
			enable = true,
		},
		rainbow = {
			enable = true,
			-- list of languages you want to disable the plugin for
			disable = { "jsx", "cpp" },
			-- Which query to use for finding delimiters
			query = "rainbow-parens",
			-- Highlight the entire buffer all at once
			strategy = require("ts-rainbow").strategy.global,
		},
	})
end

return M
