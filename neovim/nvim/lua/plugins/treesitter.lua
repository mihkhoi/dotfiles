require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "vim", "cpp" },
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

	autotag = {
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
