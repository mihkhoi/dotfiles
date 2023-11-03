set mouse=a                 " Enable mouse
set tabstop=4               " 
set shiftwidth=4            " 
"set relativenumber
set expandtab
"set listchars=tab:\|\ ""\¦\       " Tab charactor 
set list
set foldmethod=syntax " You wnat hidden code after function switch manual = syntax        
set foldnestmax=1
set foldlevelstart=3        "  
set number                  " Show line number
set ignorecase              " Enable case-sensitive 

" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize 
set synmaxcol=200
set lazyredraw
au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype

" Set font for ui
set guifont=JetBrainsMono\ Nerd\ Font:h13
":h13 size font
"set guifont=Hack\ Nerd\ Font
"set guifont=Hack\ NF
" Set format of tab name 
"set guitablabel=\[%N\]\ %t\ %M 

" Show diagnostics sign on number
set signcolumn=number

" Show cursorline number
"hi CursorLineNr guifg=#FF00CC     "#af00af
set cursorline
set cursorlineopt=number
"highlight CurrentNumber guifg=orange gui=italic

"set shell=path/to/powershell.exe
"set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy RemoteSigned\ -Command\ [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8
"set shellquote=\"
"set shellxquote=

syntax on

" Enable copying from vim to clipboard
if has('win32')
  set clipboard=unnamed  
else
  set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None
