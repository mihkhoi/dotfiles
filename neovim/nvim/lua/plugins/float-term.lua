-- Floaterm configs
vim.g.floaterm_position = "topright"
vim.g.floaterm_width = 0.7
vim.g.floaterm_height = 0.7
vim.g.floaterm_title = "Terminal $1/$2"
vim.g.floaterm_wintype = "float"
vim.g.floaterm_rootmarkers = { ".pro" }

-- Set shell for Windows
if vim.fn.has("win32") == 1 then
	vim.g.floaterm_shell = "pwsh"
end

-- Highlight Floaterm colors (like :highlight command)
vim.cmd([[
    highlight Floaterm guibg=Grey15
    highlight FloatermBorder guifg=Orange guibg=DarkGreen
    " highlight FloatermNC guibg=darkred
]])

-- Autocmd (placeholder - chưa có nội dung cụ thể)
vim.api.nvim_create_autocmd("User", {
	pattern = "FloatermOpen",
	callback = function()
		-- Bạn có thể thêm logic tại đây nếu cần
	end,
})

-- Keymaps
local opts = { silent = true }

-- New terminal
vim.keymap.set("n", "<leader>to", ":FloatermNew<CR>", opts)
vim.keymap.set("t", "<leader>to", "<C-\\><C-n>:FloatermNew<CR>", opts)

-- Kill current terminal & go back
vim.keymap.set("n", "<leader>tk", ":FloatermKill<CR>:FloatermPrev<CR>", opts)
vim.keymap.set("t", "<leader>tk", "<C-\\><C-n>:FloatermKill<CR>:FloatermPrev<CR>", opts)

-- Next / Previous terminal
vim.keymap.set("n", "<leader>tn", ":FloatermNext<CR>", opts)
vim.keymap.set("t", "<leader>tn", "<C-\\><C-n>:FloatermNext<CR>", opts)

vim.keymap.set("n", "<leader>tp", ":FloatermPrev<CR>", opts)
vim.keymap.set("t", "<leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", opts)

-- Toggle terminal
vim.keymap.set("n", "<leader>tt", ":FloatermToggle<CR>", opts)
vim.keymap.set("t", "<leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", opts)

-- Focus terminal window
vim.keymap.set("n", "<leader>tf", "<C-\\><C-n><C-W><Left>", opts)
vim.keymap.set("t", "<leader>tf", "<C-\\><C-n><C-W><Left>", opts)

-- Git log in Floaterm
vim.keymap.set(
	"n",
	"<leader>gl",
	":FloatermNew! --position=bottomright --height=0.95 --width=0.7 --title='GitLog' git lg<CR>",
	opts
)
