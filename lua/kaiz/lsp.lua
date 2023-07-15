local M = {
	"neovim/nvim-lspconfig",
	lazy = false,
  event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
		},
	},
}

local cmp_nvim_lsp = require("cmp_nvim_lsp")
function M.config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

	local function lsp_keymaps(bufnr)
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_buf_set_keymap
		keymap(bufnr, "n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
		keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		keymap(bufnr, "n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
		keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		keymap(bufnr, "n", "gl", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
		keymap(bufnr, "n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
		keymap(bufnr, "n", "gb", "<cmd>Telescope lsp_type_definitions<CR>", opts)
		keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
		keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
		keymap(bufnr, "n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
		keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
		keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
		keymap(bufnr, "n", "<leader>lr", "<cmd>Lspsaga rename ++project<cr>", opts)
		keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		-- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	end

	local lspconfig = require("lspconfig")
	local on_attach = function(client, bufnr)	
		lsp_keymaps(bufnr)
		require("illuminate").on_attach(client)
	end

	for _, server in pairs(require("utils").servers) do
		Opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "settings." .. server)
		if require_ok then
			Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
		end

		lspconfig[server].setup(Opts)
	end

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = true,
    -- virtual_text = {
    --     spacing = 4,
    --     source = "if_many",
    --     prefix = "●",
    -- },
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			suffix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M
