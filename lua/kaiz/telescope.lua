local M = {
	"nvim-telescope/telescope.nvim",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{
			"ahmedkhalf/project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
}

M.opts = {}
return M
