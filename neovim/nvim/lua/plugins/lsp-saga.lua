require("lspsaga").setup({
	ui = {
		border = "border",
		devicon = true,
		title = true,
		lines = { "┗", "┣", "┃", "━", "┏" },
	},

	symbol_in_winbar = {
		enable = true,
		--separator = " ❯ ", -- đổi ký hiệu phân cách
		separator = "  ", -- đổi ký hiệu phân cách
		hide_keyword = false, -- ẩn "function", "class", v.v.
		show_file = true, -- không hiển thị tên file đầu dòng
		folder_level = 0, -- số cấp thư mục sẽ hiển thị
		color_mode = false, -- không dùng màu
	},
})
--require("lspsaga").setup({
--	lightbulb = {
--		enable = false,
--	},
--	use_saga_diagnostic_sign = true,
--	error_sign = "",
--	warn_sign = "",
--	hint_sign = "💡",
--	infor_sign = "",
--	diagnostic_header_icon = "   ",
--	code_action_icon = "💡",
--	code_action_prompt = {
--		enable = true,
--		sign = true,
--		sign_priority = 20,
--		virtual_text = true,
--	},
--	finder_definition_icon = "🔍 ",
--	finder_reference_icon = "🔗 ",
--	max_preview_lines = 10,
--	finder_action_keys = {
--		open = "o",
--		vsplit = "s",
--		split = "i",
--		quit = "q",
--		scroll_down = "<C-f>",
--		scroll_up = "<C-b>",
--	},
--	code_action_keys = {
--		quit = "q",
--		exec = "<CR>",
--	},
--	rename_action_keys = {
--		quit = "<C-c>",
--		exec = "<CR>",
--	},
--	definition_preview_icon = "👀",
--	border_style = "single",
--	rename_prompt_prefix = "➤",
--	server_filetype_map = {},
--})
