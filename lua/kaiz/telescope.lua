return {
	"nvim-telescope/telescope.nvim",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{
			"ahmedkhalf/project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"debugloop/telescope-undo.nvim",
		},
	},
	opts = {
		defaults = {
			file_ignore_patterns = { ".git/", "node_modules" },
			layout_config = {
				preview_width = 0.6,
				prompt_position = "top",
			},
			path_display = { "smart" },
			prompt_position = "top",
			prompt_prefix = " ",
			selection_caret = " ",
			sorting_strategy = "ascending",
		},
		pickers = {
			buffers = {
				prompt_prefix = "﬘ ",
			},
			commands = {
				prompt_prefix = " ",
			},
			git_files = {
				prompt_prefix = " ",
				show_untracked = true,
			},
			find_files = {
				prompt_prefix = " ",
				find_command = { "rg", "--files", "--hidden" },
			},
		},
		extensions = {
			undo = {
				use_delta = true,
				use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
				side_by_side = false,
				diff_context_lines = vim.o.scrolloff,
				entry_format = "state #$ID, $STAT, $TIME",
				time_format = "",
				mappings = {},
			},
		},
	},
}
