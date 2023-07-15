local M = {
	"mfussenegger/nvim-dap",
	dependencies = "theHamsta/nvim-dap-virtual-text",
	event = "VeryLazy",
}

function M.config()
	local dap = require("dap")
	require("nvim-dap-virtual-text").setup({
		commented = true,
	})
	local dap_ui_status_ok, dapui = pcall(require, "dapui")
	if not dap_ui_status_ok then
		return
	end

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

return M
