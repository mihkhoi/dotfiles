-- Các thiết lập đơn giản (biến không có ký tự đặc biệt)
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "dracula"
vim.o.showmode = false

-- Thiết lập các biểu tượng (có thể dùng vim.g trực tiếp)
vim.g.airline_symbols = {
	readonly = "",
	linenr = ":",
	maxlinenr = "☰",
	notexists = "⚡",
	dirty = "⚡",
	left_sep = "",
	left_alt_sep = "",
	right_sep = "",
	right_alt_sep = "",
}

-- Với các biến có ký tự #, dùng vim.cmd để viết dạng Vimscript
vim.cmd([[
  let g:airline#extensions#tabline#enabled = 1
  "let g:airline#extensions#tabline#left_sep = ''
  "let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#formatter = 'default'
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#close_symbol = 'X'

  let g:airline#extensions#whitespace#enabled = 0
  let g:airline#extensions#nvimlsp#error_symbol = ' '
  let g:airline#extensions#nvimlsp#warning_symbol = ' '
]])
