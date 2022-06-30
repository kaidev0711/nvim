local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.black,
		-- formatting.gofmt,
		-- formatting.shfmt,
		-- formatting.clang_format,
		-- formatting.cmake_format,
		formatting.stylua,
		-- formatting.gitsigns,
		-- formatting.dart_format,
		-- formatting.lua_format.with({
		--     extra_args = {
		--         '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
		--         '--break-after-table-lb', '--indent-width=2'
		--     }
		-- }),
		-- formatting.isort,
		-- formatting.codespell.with({ filetypes = { 'markdown' } })
	},
	on_attach = function(client)
		-- if client.supports_method("textDocument/formatting") then
		--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		--     vim.api.nvim_create_autocmd("BufWritePre", {
		--         group = augroup,
		--         buffer = bufnr,
		--         callback = function()
		--             lsp_formatting(bufnr)
		--         end,
		--     })
		-- end
		if client.server_capabilities.documentHighlightProvider then
			--[[ vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
			    group = augroup,
			    buffer = bufnr,
			    callback = function()
			        lsp_formatting(bufnr)
			    end,
			}) ]]
			vim.cmd("autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()")
		end

		--     vim.cmd [[
		--   augroup document_highlight
		--     autocmd! * <buffer>
		--     autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
		--     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		--   augroup END
		-- ]]
	end,
})

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
