require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "cpp", "html", "css" },
	sync_install = false,
	auto_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},

	autopairs = {
		enable = true,
	},

	playground = {
		enable = true,
	},

	rainbow = {
		enable = true,
		extended_mode = true,
	},
})

require("nvim-ts-autotag").setup()
