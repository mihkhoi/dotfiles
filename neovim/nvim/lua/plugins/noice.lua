-- Đảm bảo bạn đã cài đặt notify
vim.notify = require("notify").setup()

require("noice").setup({
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
	},
	messages = {
		enabled = true,
	},
	popupmenu = {
		enabled = true,
	},
	views = {
		cmdline_popup = {
			position = {
				row = "50%",
				col = "50%",
			},
			size = {
				width = 40, -- ↓ giảm width xuống còn 40
				height = "auto",
			},
			border = {
				style = "rounded",
				padding = { 0, 1 }, -- ↓ bỏ padding dòng, giữ ngang
			},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
	},
	history = {
		enabled = true,
		view = "split",
	},
})
