call plug#begin(g:config_dir .. '/autoload/plugged')

Plug 'preservim/nerdtree'
Plug 'google/vim-searchindex'
Plug 'mbbill/undotree'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

" Git (WIP)
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Neogit
" Plug 'nvim-lua/plenary.nvim' " installed for telescope
Plug 'NeogitOrg/neogit'
Plug 'sindrets/diffview.nvim'

" Telescope and dependencies
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'seblyng/roslyn.nvim'
Plug 'tris203/rzls.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

" Oil
Plug 'stevearc/oil.nvim'

" Colorschemes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'projekt0n/github-nvim-theme'
Plug 'Mofiqul/vscode.nvim'
Plug 'nyoom-engineering/oxocarbon.nvim'
" Plug 'whatyouhide/vim-gotham'
" Plug 'marcopaganini/termschool-vim-theme'
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'cdmill/neomodern.nvim'
Plug 'ellisonleao/gruvbox.nvim'
" Plug 'sainnhe/gruvbox-material.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'srt0/everblush.nvim'
call plug#end()
