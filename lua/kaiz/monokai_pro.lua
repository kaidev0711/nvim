return {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	name = "monokai-pro",
	config = function()
		require("monokai-pro").setup({
			background_clear = { "float_win" },
		})
		vim.cmd([[colorscheme monokai-pro]])
	end,
}
