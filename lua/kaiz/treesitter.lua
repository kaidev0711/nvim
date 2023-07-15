local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
		"windwp/nvim-ts-autotag",
	},
}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"lua",
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
	})
end

return M
