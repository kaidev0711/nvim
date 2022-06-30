local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
	})
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use("marko-cerovac/material.nvim")
	use("olimorris/onedarkpro.nvim")
	-- Using Packer
	use("navarasu/onedark.nvim")
	-- Using Packer:
	use("Mofiqul/dracula.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("tamton-aquib/staline.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("onsails/lspkind.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-lua/plenary.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-autopairs" })
	use({ "tami5/lspsaga.nvim" }) -- nightly
	use("folke/which-key.nvim")
	use({ "akinsho/toggleterm.nvim", tag = "v1.*" })
	use("folke/twilight.nvim")
	use("folke/zen-mode.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("famiu/bufdelete.nvim")
	use("lewis6991/gitsigns.nvim")
	use("rcarriga/nvim-notify")

	use("rcarriga/cmp-dap")
	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")
	use("nvim-telescope/telescope-dap.nvim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("ggandor/lightspeed.nvim")
	use("tpope/vim-repeat")
	use("karb94/neoscroll.nvim")

    -- use 'github/copilot.vim'
    use {
     "zbirenbaum/copilot.lua",
        event = {"VimEnter"},
        config = function()
        vim.defer_fn(function()
                  require("copilot").setup()
            end, 100)
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        module = "copilot_cmp",
    }  
	if packer_bootstrap then
		require("packer").sync()
	end
end)
