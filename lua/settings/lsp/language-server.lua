local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)



vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").html.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig").emmet_ls.setup({
	-- on_attach = on_attach,
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
})
require("lspconfig").clangd.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
require("lspconfig").dockerls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})
