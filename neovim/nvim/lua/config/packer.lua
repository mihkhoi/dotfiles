-- Auto install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

-- Plugin list
return require("packer").startup(function(use)
	-- Plugin manager itself
	use("wbthomason/packer.nvim")

	-- Theme
	use("joshdick/onedark.vim") -- Dark theme
	use({ "dracula/vim", as = "dracula" }) -- Dracula theme

	-- File browser
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- Biểu tượng thư mục
			"ryanoasis/vim-devicons", -- Biểu tượng font
		},
	})

	-- File search
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Status bar
	use({
		"vim-airline/vim-airline",
		requires = { { "vim-airline/vim-airline-themes" } },
	})

	-- Terminal
	use("voldikss/vim-floaterm")

	-- Autopairs
	use({ "windwp/nvim-autopairs" })

	-- LSP
	use("williamboman/mason.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason-lspconfig.nvim")

	-- Cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")

	-- Luasnip
	use("L3MON4D3/LuaSnip")

	-- Lspkind
	use("onsails/lspkind.nvim")

	-- Lspsage
	--use("nvimdev/lspsaga.nvim")

	-- Code syntax highight
	use("nvim-treesitter/nvim-treesitter")

	-- Format
	use("nvimtools/none-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	--Debugging
	use("mfussenegger/nvim-dap")
	use("nvim-neotest/nvim-nio")
	use("rcarriga/nvim-dap-ui")
	use("jay-babu/mason-nvim-dap.nvim")

	-- Source code version control
	use("tpope/vim-fugitive") -- Git infomation
	use("tpope/vim-rhubarb")
	use("airblade/vim-gitgutter") -- Git show changes
	use("samoshkin/vim-mergetool") -- Git merge

	-- Indent
	use("lukas-reineke/indent-blankline.nvim")

	-- Startup
	use("goolord/alpha-nvim")

	-- Noice
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	-- Autotag
	use("windwp/nvim-ts-autotag")

	-- Tự động sync nếu lần đầu cài packer
	if packer_bootstrap then
		require("packer").sync()
	end
end)
