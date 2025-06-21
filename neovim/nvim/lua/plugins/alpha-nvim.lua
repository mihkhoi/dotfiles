local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

-- Header (ASCII art)
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \_/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

-- Buttons (menu options)
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC | lua vim.notify('Loaded config', 'info')<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Footer (can use fortune or leave empty)
local function footer()
	-- Optional: enable this if you have fortune installed
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "🎉 Happy coding with Neovim!"
end

dashboard.section.footer.val = footer()

-- Highlights
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Type"

-- Disable autocommands to avoid conflicts
dashboard.opts.opts.noautocmd = true

-- Optional: Notify when Alpha is ready
vim.cmd([[autocmd User AlphaReady echo '✅ Alpha dashboard loaded']])

alpha.setup({
	layout = {
		{ type = "padding", val = 4 },
		dashboard.section.header,
		{ type = "padding", val = 2 },
		dashboard.section.buttons,
		{ type = "padding", val = 2 },
		dashboard.section.footer,
	},
	opts = dashboard.opts,
})
