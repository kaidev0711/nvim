local M = {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
}
function M.config()
	require("zen-mode").setup({
		window = {
			backdrop = 0.95,
			width = 100,
			height = 0.8,
			options = { signcolumn = "no", number = false, cursorline = false },
		},
		plugins = {
			options = { enabled = true, ruler = false, showcmd = false },
			twilight = { enabled = true },
			gitsigns = { enabled = true },
			tmux = { enabled = true },
			alacritty = {
				enabled = false,
				font = "16", -- font size
			},
		},
	})
end

return M
