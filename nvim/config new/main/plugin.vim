call plug#begin('~/AppData/Local/nvim/plugged')
" Theme
    Plug 'joshdick/onedark.vim'                  " Dark theme

" File browser
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'                 " Icon

" File search
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

" Status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

" Terminal
    Plug 'voldikss/vim-floaterm'                  " Float terminal

" Autopairs
    Plug 'windwp/nvim-autopairs'

" Mason
    Plug 'williamboman/mason.nvim'

" LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason-lspconfig.nvim'

" Cmp
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
    Plug 'L3MON4D3/LuaSnip'
  
" Lspkind
    Plug 'onsails/lspkind.nvim'

" Lspsaga
    Plug 'kkharji/lspsaga.nvim'

" Code syntax highlight
    Plug 'nvim-treesitter/nvim-treesitter'

" Format
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'jay-babu/mason-null-ls.nvim'

" Debugging
"   Plug 'mfussenegger/nvim-dap'
"   Plug 'rcarriga/nvim-dap-ui'
"   Plug 'jay-babu/mason-nvim-dap.nvim' 
"    Plug 'puremourning/vimspector'

" Source code version control 
    Plug 'tpope/vim-fugitive'                     " Git infomation 
    Plug 'tpope/vim-rhubarb' 
    Plug 'airblade/vim-gitgutter'                 " Git show changes 
    Plug 'samoshkin/vim-mergetool'                " Git merge

" Indent
    Plug 'lukas-reineke/indent-blankline.nvim'

" Startup
    Plug 'goolord/alpha-nvim'

call plug#end()
