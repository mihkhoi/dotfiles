require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		keymaps = {
			toggle_package_expand = "<CR>",
			install_package = "i",
			update_package = "u",
			check_package_version = "c",
			update_all_packages = "U",
			check_outdated_packages = "C",
			uninstall_package = "X",
			cancel_installation = "<C-c>",
			apply_language_filter = "<C-f>",
		},
	},
})

-- LSP Servers
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "lua_ls" },
	automatic_installation = true,
})

-- Formatters / Linters
require("mason-null-ls").setup({
	ensure_installed = { "clang-format", "stylua" },
	automatic_installation = true,
})
-- Debug
require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
})
