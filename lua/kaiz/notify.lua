return {
 "rcarriga/nvim-notify",
  event = "VeryLazy",
  keys = {
    {
      "<leader>kd",
      function()
        local ok, nvim_notify = pcall(require, "nvim-notify")
        if not ok then
          return
        end
        nvim_notify.dismiss({ silent = true, pending = true })
      end,
      desc = "Delete all Notifications",
    },
  },
  opts = {
    timeout = 3000,
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
    -- background_colour = "Normal",
    -- stages = "fade_in_slide_out",
    stages = "slide",
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
  init = function()
    local ok, notify = pcall(require, "notify")
    if not ok then
      return
    end
    vim.notify = notify
  end,
}
