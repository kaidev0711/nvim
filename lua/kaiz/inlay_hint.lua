return {
	{
		"lvimuser/lsp-inlayhints.nvim",
		ft = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact", "svelte", "go" },
		-- enabled = enabled_inlay_hints,
		opts = {
			debug_mode = true,
			inlay_hints = { type_hints = { prefix = "=> " } },
		},
		config = function(_, options)
			vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = "LspAttach_inlayhints",
				callback = function(args)
					if not (args.data and args.data.client_id) then
						return
					end

					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					require("lsp-inlayhints").on_attach(client, bufnr)
				end,
			})
			require("lsp-inlayhints").setup(options)
			-- define key map for toggle inlay hints: require('lsp-inlayhints').toggle()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ki",
				"<cmd>lua require('lsp-inlayhints').toggle()<CR>",
				{ noremap = true, silent = true, desc = "Toggle Inlay Hints" }
			)
		end,
	},
}
