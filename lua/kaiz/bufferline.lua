return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = {
		{
			"famiu/bufdelete.nvim",
		},
	},
  opts = {
    options = {
			diagnostics = "nvim_lsp",
			-- numbers = "buffer_id",
			diagnostics_update_in_insert = true,
			separator_style = "thin",
			always_show_bufferline = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "NvimTree",
          highlight = "Directory",
          text_align = "center",
        },
      },
		},
  }
}
