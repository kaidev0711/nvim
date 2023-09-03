return {
	"kyazdani42/nvim-tree.lua",
	event = "VimEnter",
	cmd = { "NvimTreeToggle" },
	opts = {
		disable_netrw = false,
		hijack_netrw = true,
		respect_buf_cwd = true,
		filters = {
			custom = { "^.git$" },
		},
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		view = {
			side = "right",
			width = 35,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		git = {
			ignore = false,
		},
	},
}
