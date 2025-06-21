-- Enable mouse
vim.o.mouse = "a"

-- Tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Folding
vim.o.foldmethod = "syntax"
vim.o.foldnestmax = 1
vim.o.foldlevelstart = 3
vim.cmd([[autocmd BufNewFile,BufRead *.json setlocal foldmethod=indent]])

-- Ignore case
vim.o.ignorecase = true

-- Disable backups
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Optimization
vim.o.synmaxcol = 200
vim.o.lazyredraw = false

-- Font (GVim / GUI only)
vim.o.termguicolors = true
vim.o.guifont = "JetBrainsMono Nerd Font:h13"

-- Sign column
vim.wo.signcolumn = "number"

-- Cursor
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

-- Syntax on
vim.cmd("syntax on")

-- Clipboard
if vim.fn.has("win32") == 1 then
	vim.o.clipboard = "unnamed"
else
	vim.o.clipboard = "unnamedplus"
end

-- Auto reload when file changed outside
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "FocusGained", "BufEnter" }, {
	callback = function()
		if not vim.api.nvim_get_mode().mode:match("[c!r?t]") and vim.fn.getcmdwintype() == "" then
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	callback = function()
		vim.api.nvim_echo({ { "File changed on disk. Buffer reloaded.", "WarningMsg" } }, false, {})
	end,
})

-- Set colorscheme
vim.cmd("colorscheme dracula") -- hoặc "onedark" nếu bạn thích

-- Set winbar lspsaga theme dracula
vim.api.nvim_set_hl(0, "WinBar", { fg = "#bd93f9", bg = "#282a36", bold = true })
vim.api.nvim_set_hl(0, "WinBarNC", { fg = "#6272a4", bg = "#282a36" })

-- Gọi hàm tùy chỉnh highlight của plugin onedark (nếu dùng)
vim.api.nvim_create_augroup("colorextend", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "colorextend",
	pattern = "*",
	callback = function()
		-- Chỉ chạy nếu đang dùng onedark
		if vim.g.colors_name == "onedark" and vim.fn.exists("*onedark#extend_highlight") == 1 then
			vim.fn["onedark#extend_highlight"]("Comment", { fg = { gui = "#728083" } })
			vim.fn["onedark#extend_highlight"]("LineNr", { fg = { gui = "#728083" } })
		end
	end,
})

-- Disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function(args)
		local win = tonumber(args.match)
		if win and vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
	end,
})

vim.diagnostic.config({
	virtual_text = true, -- Hiện text trong dòng
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "💡",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Compile and run C++ with <leader>d
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<leader>d",
			[[:silent! w<CR>:silent! execute '!g++ -std=c++17 % -o %:r && start cmd /c "%:r"' <CR>:redraw!<CR>]],
			{ noremap = true, silent = true }
		)
	end,
})
