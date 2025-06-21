require("nvim-autopairs").setup({
	check_ts = true, -- bật nếu bạn dùng treesitter để hiểu ngữ cảnh
	disable_filetype = { "TelescopePrompt", "vim" },
	fast_wrap = {
		map = "<M-e>", -- Alt + e để bao nhanh
		chars = { "{", "[", "(", '"', "'", "`" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})
