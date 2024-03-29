-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Normal --
--toggle number
keymap("n", "<Leader>kN", ":set number!<CR>", opts)
-- Clear highlights
keymap("n", "<leader>kh", "<cmd>nohlsearch<CR>", opts)

keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize window using <shift> arrow keys
keymap("n", "<A-Up>", "<cmd>resize +2<CR>")
keymap("n", "<A-Down>", "<cmd>resize -2<CR>")
keymap("n", "<A-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<A-Right>", "<cmd>vertical resize +2<CR>")
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
-- Better paste
keymap("v", "p", "P", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Plugins --
-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
