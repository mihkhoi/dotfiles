let g:airline_powerline_fonts = 1                       " Enable font for status bar
let g:airline_theme='onedark'                           " Theme OneDark

let g:airline#extensions#tabline#enabled = 1            " Enable Tab bar
let g:airline#extensions#tabline#left_sep = ' '         " Enable Tab seperator 
let g:airline#extensions#tabline#left_alt_sep = '|'     " Enable Tab seperator
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'        " Set Tab name as file name
let g:airline#extensions#tabline#close_symbol = 'X'

let g:airline#extensions#whitespace#enabled = 0         " Remove warning whitespace"

let g:airline#extensions#nvimlsp#error_symbol = ' '
let g:airline#extensions#nvimlsp#warning_symbol = ' '

" We don't need to see things like -- INSERT -- anymore
set noshowmode

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ':'
let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.notexists = '⚡'
let g:airline_symbols.dirty='⚡'

" others
"  " unicode symbols
"  let g:airline_left_sep = '»'
"  let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '«'
"  let g:airline_right_sep = '◀'
"  let g:airline_symbols.colnr = ' ㏇:'
"  let g:airline_symbols.colnr = ' ℅:'
"  let g:airline_symbols.crypt = '🔒'
"  let g:airline_symbols.linenr = '☰'
"  let g:airline_symbols.linenr = ' ␊:'
"  let g:airline_symbols.linenr = ' ␤:'
"  let g:airline_symbols.linenr = '¶'
"  let g:airline_symbols.maxlinenr = ''
"  let g:airline_symbols.maxlinenr = '㏑'
"  let g:airline_symbols.branch = '⎇'
"  let g:airline_symbols.paste = 'ρ'
"  let g:airline_symbols.paste = 'Þ'
"  let g:airline_symbols.paste = '∥'
"  let g:airline_symbols.spell = 'Ꞩ'
"  let g:airline_symbols.notexists = 'Ɇ'
"  let g:airline_symbols.notexists = '∄'
"  let g:airline_symbols.whitespace = 'Ξ'
"
" " powerline symbols
"  let g:airline_left_sep = ''
"  let g:airline_left_alt_sep = ''
"  let g:airline_right_sep = ''
"  let g:airline_right_alt_sep = ''
"  let g:airline_symbols.branch = ''
"  let g:airline_symbols.colnr = '℅:'
"  let g:airline_symbols.readonly = ''
"  let g:airline_symbols.linenr = ':'
"  let g:airline_symbols.maxlinenr = '☰ '
"  let g:airline_symbols.dirty='⚡'

  " old vim-powerline symbols
"  let g:airline_left_sep = '⮀'
"  let g:airline_left_alt_sep = '⮁'
"  let g:airline_right_sep = '⮂'
"  let g:airline_right_alt_sep = '⮃'
"  let g:airline_symbols.branch = '⭠'
"  let g:airline_symbols.readonly = '⭤'
"  let g:airline_symbols.linenr = '⭡'
