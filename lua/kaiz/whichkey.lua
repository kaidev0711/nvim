local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}
function M.config()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end
	local setup = {}
	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	local v_opts = {
		mode = "v", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}
	local v_mappings = {
		c = {
			name = "Coding",
			j = { "<cmd>GoJson2Struct<cr>", "Json to struct" },
		},
	}
	local mappings = {
		a = { "<cmd>Alpha<cr>", "Alpha" },
		q = { ":q<cr>", "Quit" },
		Q = { ":wq<cr>", "Save & Quit" },
		E = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
		k = {
			name = "other",
			n = {
				name = "noice",
				f = { "<cmd>Noice telescope<cr>", "Noice telescope" },
			},
			v = {
				name = "split",
				s = { "<cmd>split<cr>", "Split" },
				v = { "<cmd>vsplit<cr>", "Vsplit" },
			},
			o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
			r = {
				name = "refactoring",
				i = { " <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
				p = { " <Esc><Cmd>lua require('refactoring').debug.printf({below = false})<CR>", "Debug Print" },
				c = { " <Esc><Cmd>lua require('refactoring').debug.cleanup({below = false})<CR>", "Debug Cleanup" },
			},
		},
		t = {
			name = "terminal",
			n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
			-- u = { "<cmd>lua _DUST_TOGGLE()<cr>", "Dust" },
			b = { "<cmd>lua _BTOP_TOGGLE()<cr>", "btop" },
			c = { "<cmd>lua _CTOP_TOGGLE()<cr>", "ctop" },
			k = { "<cmd>lua _LAZYDOCKER_TOGGLE()<cr>", "Lazy Docker" },
			g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazy Git" },
			p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
			i = { "<cmd>lua _PROJECT_INFO_TOGGLE()<CR>", "Project Info" },
			f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
			t = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
			v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		},
		z = {
			name = "Focus",
			z = { ":ZenMode<cr>", "Toggle Zen Mode" },
			t = { ":Twilight<cr>", "Toggle Twilight" },
		},
		x = {
			name = "todo-comment",
			t = { ":TodoTelescope<cr>", "Todo" },
			q = { ":TodoQuickFix<cr>", "Quickfix" },
			l = { ":TodoLocList<cr>", "Loclist" },
			b = { ":TodoTrouble<cr>", "Trouble" },
			j = { "<cmd>lua require('todo-comments').jump_next()<cr>", "Next todo comment" },
			k = { "<cmd>lua require('todo-comments').jump_prev()<cr>", "Previous todo comment" },
		},
		f = {
			name = "telescope",
			B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			U = { "<cmd>Telescope undo<cr>", "Undo" },
			u = { "<cmd>UrlView buffer action=clipboard<cr>", "Copy url" },
			n = { ":lua require('telescope').extensions.notify.notify()<cr>", "Notify History" },
			P = {
				"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
				"Colorscheme with Preview",
			},
			d = { "<cmd>Telescope file_browser path=%:p:h<CR>", "Browse Files" },
		},
		g = {
			name = "Git",
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				"Undo Stage Hunk",
			},
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = {
				"<cmd>Gitsigns diffthis HEAD<cr>",
				"Diff",
			},
		},
		i = {
			name = "illuminate",
			i = { '<cmd>lua require"illuminate".toggle()<cr>', "Illuminate" },
			n = { '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', "next_reference" },
			r = { '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', "next_reference reverse" },
		},
		h = {
			name = "Harpoon",
			a = { ":lua require('harpoon.mark').add_file()<cr>", "Add File" },
			-- f = { ":lua require('telescope').extensions.harpoon.marks()<cr>", "find file" },
			t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "toggle harpoon" },
			j = {
				function()
					require("harpoon.ui").nav_file(1)
				end,
				"Mark 1",
			},
			k = {
				function()
					require("harpoon.ui").nav_file(2)
				end,
				"Mark 2",
			},
			h = {
				function()
					require("harpoon.ui").nav_file(3)
				end,
				"Mark 3",
			},
			l = {
				function()
					require("harpoon.ui").nav_file(4)
				end,
				"Mark 4",
			},
		},
		b = {
			name = "Trouble",
			x = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
			w = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble workspace_diagnostics" },
			d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble document_diagnostics" },
			l = { "<cmd>Trouble loclist<cr>", "Trouble loclist" },
			q = { "<cmd>Trouble quickfix<cr>", "Trouble quickfix" },
			r = { "<cmd>Trouble lsp_references<cr>", "Trouble lsp_references" },
		},
		l = {
			name = "lsp",
			e = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			E = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
			d = {
				"<cmd>Telescope diagnostics bufnr=0<cr>",
				"Document Diagnostics",
			},
			w = {
				"<cmd>Telescope diagnostics<cr>",
				"Workspace Diagnostics",
			},
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		},
		d = {
			name = "debug",
			R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
			E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
			C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
			U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
			b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
			c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
			d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
			e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
			f = {
				"<cmd>lua require('dapui').float_element(<element ID>, <optional settings>)<cr>",
				"dapui float_element",
			},
			g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
			h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
			S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
			o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
			p = { "<cmd>lua require'dap'.pause.toggle()<CR>", "Pause" },
			q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
			r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
			s = { "<cmd>lua require'dap'.continue()<CR>", "Start" },
			t = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
			x = { "<cmd>lua require'dap'.terminate()<CR>", "Terminate" },
			u = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
		},
		c = {
			name = "Coding",
			a = { "<cmd>GoCodeAction<cr>", "Code action" },
			e = { "<cmd>GoIfErr<cr>", "Add if err" },
			h = {
				name = "Helper",
				a = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
				r = { "<cmd>GoRMTag<cr>", "Remove tags to struct" },
				c = { "<cmd>GoCoverage<cr>", "Test coverage" },
				g = { "<cmd>lua require('go.comment').gen()<cr>", "Generate comment" },
				v = { "<cmd>GoVet<cr>", "Go vet" },
				t = { "<cmd>GoModTidy<cr>", "Go mod tidy" },
				i = { "<cmd>GoModInit<cr>", "Go mod init" },
			},
			i = { "<cmd>GoToggleInlay<cr>", "Toggle inlay" },
			l = { "<cmd>GoLint<cr>", "Run linter" },
			o = { "<cmd>GoPkgOutline<cr>", "Outline" },
			r = { "<cmd>GoRun<cr>", "Run" },
			s = { "<cmd>GoFillStruct<cr>", "Autofill struct" },
			t = {
				name = "Tests",
				r = { "<cmd>GoTest<cr>", "Run tests" },
				a = { "<cmd>GoAlt!<cr>", "Open alt file" },
				s = { "<cmd>GoAltS!<cr>", "Open alt file in split" },
				v = { "<cmd>GoAltV!<cr>", "Open alt file in vertical split" },
				u = { "<cmd>GoTestFunc<cr>", "Run test for current func" },
				f = { "<cmd>GoTestFile<cr>", "Run test for current file" },
			},
			x = {
				name = "Code Lens",
				l = { "<cmd>GoCodeLenAct<cr>", "Toggle Lens" },
				a = { "<cmd>GoCodeAction<cr>", "Code Action" },
			},
			m = {
				name = "markdown",
				p = { ":MarkdownPreview<cr>", "preview" },
				d = { ":MarkdownPreviewStop<cr>", "stop" },
				t = { ":MarkdownPreviewToggle<cr>", "toggle" },
			},
		},
	}
	which_key.setup(setup)
	which_key.register(mappings, opts)
	which_key.register(v_mappings, v_opts)
end
return M
