local M = {
	"nvim-lualine/lualine.nvim",
	-- event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	event = "VeryLazy",
}
function M.config()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end
	lualine.setup({
		options = {
			disabled_filetypes = {
				"TelescopePrompt",
				"packer",
				"alpha",
				"dashboard",
				"Outline",
				"DressingInput",
				"toggleterm",
				"lazy",
				"nvdash",
				"NvimTree",
				"nvcheatsheet",
			},
		},
	})
end
return M
