require("bufferline").setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "NvimTree" } },
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})

