"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                 " Enable mouse
set tabstop=4               " 
set shiftwidth=4            " 
"set relativenumber
set expandtab
"set listchars=tab:\|\ "\¦\       " Tab charactor 
set list
set foldmethod=syntax       " You wnat hidden code after function switch manual = syntax        
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
set guitablabel=\[%N\]\ %t\ %M 

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap <silent><esc> :noh<CR>

" Rab
map <silent> <S-w> :bd<CR>
map <silent> <S-tab> :bn<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used with Vim-plug - https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/AppData/Local/nvim/plugged')
" Theme
  Plug 'joshdick/onedark.vim',                  " Dark theme

" File browser
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'
"  Plug 'preservim/nerdTree'                     " File browser  
"  Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
  Plug 'ryanoasis/vim-devicons'                 " Icon
"  Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file 
"  Plug 'jcharum/vim-nerdtree-syntax-highlight',
"    \ {'branch': 'escape-keys'}

" File search
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
"  Plug 'voldikss/vim-floaterm'                  " Float terminal
  Plug 'NvChad/nvterm'

" Code intellisense
"  Plug 'neoclide/coc.nvim', 
"    \ {'branch': 'release'}                     " Language server protocol (LSP) 
"  Plug 'jiangmiao/auto-pairs'                   " Parenthesis auto 
  Plug 'windwp/nvim-autopairs'
  "Plug 'mattn/emmet-vim' 
  "Plug 'preservim/nerdcommenter'                " Comment code 
  " Plug 'liuchengxu/vista.vim'                   " Function tag bar
  "Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag 
"    \ { 
"      \ 'do': 'yarn install '
"              \ .'--frozen-lockfile '
"              \ .'&& yarn build',
"      \ 'branch': 'main' 
"    \ }

" LSP
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
  Plug 'L3MON4D3/LuaSnip'
  
" Lspkind
  Plug 'onsails/lspkind.nvim'

" Lspsaga
"  Plug 'nvimdev/lspsaga.nvim'
  Plug 'kkharji/lspsaga.nvim'

" Code syntax highlight
  Plug 'nvim-treesitter/nvim-treesitter',

" Debugging
  Plug 'puremourning/vimspector'

" Source code version control 
  Plug 'tpope/vim-fugitive'                     " Git infomation 
  Plug 'tpope/vim-rhubarb' 
  Plug 'airblade/vim-gitgutter'                 " Git show changes 
  Plug 'samoshkin/vim-mergetool'                " Git merge

  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'goolord/alpha-nvim'

"  Plug 'jose-elias-alvarez/null-ls.nvim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme 
colorscheme onedark

" Overwrite some color highlight 
if (has("autocmd"))
  augroup colorextend
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
  augroup END
endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Other setting
"let nvim_settings_dir = '~\AppData\Local\nvim\settings\'
"execute 'source '.nvim_settings_dir.'coc.vim'
source ~\AppData\Local\nvim\settings\airline.vim
"source ~\AppData\Local\nvim\settings\coc.vim
"source ~\AppData\Local\nvim\settings\floatterm.vim
"source ~\AppData\Local\nvim\settings\nerdtree.vim
source ~\AppData\Local\nvim\settings\telecope.vim
source ~\AppData\Local\nvim\settings\git.vim
source ~\AppData\Local\nvim\settings\vimspector.vim


" Other setting lua
"luafile ~\AppData\Local\nvim\luaa\core.lua

lua << EOF
require("core")
EOF
