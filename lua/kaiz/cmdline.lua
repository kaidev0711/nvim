local M = {
	"hrsh7th/cmp-cmdline",
	event = "VeryLazy",
}
function M.config()
	local cmp = require "cmp"
	local mapping = {
		["<CR>"] = cmp.mapping.confirm { select = true },
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
	}

	-- Use buffer source for `/`.
	cmp.setup.cmdline("/", {
		preselect = "none",
		completion = {
			completeopt = "menu,preview,menuone,noselect",
		},
		mapping = mapping,
		sources = {
			{ name = "buffer" },
		},
		experimental = {
			ghost_text = true,
			native_menu = false,
		},
	})

	-- Use cmdline & path source for ':'.
	cmp.setup.cmdline(":", {
		preselect = "none",
		completion = {
			completeopt = "menu,preview,menuone,noselect",
		},
		mapping = mapping,
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
		experimental = {
			ghost_text = true,
			native_menu = false,
		},
	})
end

return M
