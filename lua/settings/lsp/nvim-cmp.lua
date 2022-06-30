local luasnip = require("luasnip")
local lspkind = require("lspkind")
local compare = require("cmp.config.compare")
-- local comparators = require("copilot-cmp.comparators")
--
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmp_tabnine" },
		{ name = "dap" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			maxwidth = 40, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				vim_item.kind = lspkind.presets.default[vim_item.kind]

				local menu = source_mapping[entry.source.name]
				if entry.source.name == "copilot" then
					if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
						menu = entry.completion_item.data.detail .. " " .. menu
					end
					vim_item.kind = "[] Copilot"
					vim_item.kind_hl_group = "CmpItemKindCopilot"
				end

				if entry.source.name == "cmp_tabnine" then
					if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
						menu = entry.completion_item.data.detail .. " " .. menu
					end
					vim_item.kind = ""
				end

				vim_item.menu = menu

				return vim_item
			end,
		}),
	},
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,
	sorting = {
		priority_weight = 2,
		comparators = {
			require("cmp_tabnine.compare"),
			-- comparators.prioritize,
			-- comparators.score,
			compare.offset,
			compare.exact,
			compare.score,
			compare.recently_used,
			compare.locality,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},
})
