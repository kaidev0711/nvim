-- require('material.functions').toggle_style()

-- require('material.functions').toggle_eob()
--Lua:
-- vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })


--Lua:
-- vim.api.nvim_set_keymap('n', '<leader>me', [[<Cmd>lua require('material.functions').toggle_eob()<CR>]], { noremap = true, silent = true })

--Lua
-- require('material.functions').change_style("palenight")
-- vim.api.nvim_set_keymap('n', '<leader>ml', [[<Cmd>lua require('material.functions').change_style('lighter')<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>md', [[<Cmd>lua require('material.functions').change_style('darker')<CR>]], { noremap = true, silent = true })


-- vim.o.background = "dark" -- to load onedark
-- require("onedarkpro").load()
-- Lua
-- require('onedark').setup {
--     style = 'darker'
-- }
-- require('onedark').load()
-- Lua:
vim.cmd[[colorscheme dracula]]
