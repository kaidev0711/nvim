return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile", "BufReadPre" },
  opts = {
    -- char = "▏",
    char = "│",
    filetype_exclude = {
      "help",
      "alpha",
      "dashboard",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
      "NvimTree",
    },
    show_trailing_blankline_indent = false,
    show_current_context = false,
  },
}
