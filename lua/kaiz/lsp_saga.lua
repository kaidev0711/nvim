local M = {
	{
		"nvimdev/lspsaga.nvim",
		-- event = "VeryLazy",
		-- config = true,
		-- lazy = true,
		event = "LspAttach",
		opts = {
			symbol_in_winbar = {
				enable = false,
			},
			border_style = "rounded",
			code_action_lightbulb = {
				enable = false,
			},
		},
	},
}
return M
