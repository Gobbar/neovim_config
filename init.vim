"Neovim specific stuff
language en_US.UTF-8

let mapleader = ";"

"Main config and OS-specific stuff
if has('win64')
	set nohidden	"Фикс свап-файла
	"setup powershell
	let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
	let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
	let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
	set shellquote= shellxquote=
"elseif has('unix')
endif

"Быстрый доступ к конфигурации
let g:config_dir = fnamemodify($MYVIMRC, ':p:h')
:command ConfigFile execute 'e' g:config_dir .. '/init.vim'
:command ConfigDir execute 'e' g:config_dir
:command UpdateConfig execute 'so' g:config_dir .. '/init.vim'

"Маппинги для использования vim на русской раскладке
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
inoremap <C-х> <C-[>

"Настройка нумерации и относительной нумерации строк
set number
nnoremap <Leader>m :set invrnu<CR>

" Relative number on active window of normal mode
:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave,WinEnter,CmdlineLeave * if &nu && mode() != "i" | set rnu | redraw! | endif
:	autocmd BufLeave,FocusLost,InsertEnter,WinLeave,CmdlineEnter * if &nu | set nornu | endif
:augroup END
nnoremap : :set nornu<CR>:

" Fast buffer swap
nnoremap <silent><Leader>j :bn<CR>
nnoremap <silent><Leader>k :bp<CR>

"function UpdateNumeration()
"	let &l:rnu = mode(1) =~# '^\(no\|v\|V\|\x16\|\)'
"	redraw!
"endfunction
":au ModeChanged *:* call UpdateNumeration()

"Настройка поиска и подсветки поиска
set ignorecase	"Игнорируем регистр при поиске
set smartcase	"Игнорируем регистр при поиске, если все буквы шаблона в одном регистре
set hlsearch	"Подсветка результатов поиска
set incsearch	"Подсветка следующего вхождения шаблона поиска
nnoremap <Silent><C-h> :set invhlsearch<CR>

"Настройка отступов
set tabstop=4 "Ширина таба
set shiftwidth=4 "Ширина сдвига 

"Подключение плагинов Vim-Plug
call plug#begin(g:config_dir .. '/autoload/plugged')

"Some usefull staff
Plug 'preservim/nerdtree'
Plug 'google/vim-searchindex'
Plug 'mbbill/undotree'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

"Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"Telescope and dependencies
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" <to_del>
"Omnisharp and C# plugins
"Plug 'OmniSharp/omnisharp-vim' " After install use :OmniSharpInstall to install LSP server


" Autocompletion
"Plug 'prabirshrestha/asyncomplete.vim'
" </to_del>

"Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Autocompletion
""Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
""Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
""Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"Database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

"Colorschemes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'projekt0n/github-nvim-theme'
Plug 'Mofiqul/vscode.nvim'
Plug 'nyoom-engineering/oxocarbon.nvim'
"Plug 'whatyouhide/vim-gotham'
"Plug 'marcopaganini/termschool-vim-theme'
"Plug 'ghifarit53/tokyonight-vim'
call plug#end()

nnoremap ;<C-e> :NERDTreeToggle<CR>

"Вставка из системного буфера обмена в командном режиме
cnoremap <C-v> <C-r>+

"Маппинги терминала
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n><C-w>k

"Работа с системным регистром
:command CopyConfigDir let @* = config_dir

"Codeium
let g:codeium_enabled = v:false
let g:codeium_path = g:config_dir .. '/codeium_api'
let g:codeium_manual = v:true
"nnoremap <C-]> call codeium#Clear()
"nnoremap <M-]> call coduium#CycleCompletions(1)
"nnoremap <M-[> call codeium#CycleCompletions(-1)
"nnoremap <Tab> call codeium#Accept()
"nnoremap <M-Bslash> call codeium#Complete()

"WIP
"set splitbelow
"set splitright

"Asyncomplete
"let g:asyncomplete_auto_poput = 1
"let g:asyncomplete_auto_completeopt = 0

"Omnisharp
"if has('patch-8.1.1880')
"	set completeopt=longest,menuone,popuphidden 
"else
"	set completeopt=longest,menuone,preview
"endif
"set completeopt=menuone,noinsert,noselect,popuphidden закоменчено, т.к. вызывало ошибку

"Закрыть текущий буфер и сохранить окно
function SwitchAndCloseCurrentBuffer()
	let l:buffnum = bufnr('%')
	bn
	execute 'bd' l:buffnum
endfunction
:command Bd call SwitchAndCloseCurrentBuffer()

nnoremap <Leader><C-S-g> :Gdiffsplit<CR>

"Открыть терминал
"TODO: terminal close handler, 
function MyTermOpen()
	if !exists('t:TerminalBuffer')
		below 15split
		term
		setlocal nonumber
		setlocal bufhidden=hide
		setlocal nobuflisted
		execute 'file' 'cmd'
		let t:TerminalBuffer = bufnr('%')
		return
	endif

	let l:winnr = bufwinnr(t:TerminalBuffer)
	if l:winnr !=# -1 
		"call win_gotoid(l:winnr)
		exec l:winnr . 'hide'
	else
		below 15split
		execute 'b' t:TerminalBuffer	
	endif

"	if currentwindow = 'term'
"		i
"	endif
endfunction
nnoremap <Leader><C-t> :call MyTermOpen()<CR>

"Telescope find
nnoremap <Leader><C-P> :Telescope find_files<CR>
nnoremap <Leader><C-F> :Telescope live_grep<CR>
nnoremap <C-S-P> :Telescope 
nnoremap <Leader><C-B> :Telescope buffers<CR>

" Git
function ChangeGit()
	if !exists('t:GitToggleBuffer')
		let t:GitToggleBuffer = bufnr('%')
		:Git<CR>
		<C-W>o
	endif
endfunction
" Git toggle
nnoremap <Leader><C-G>

"Добавить Git терминал на отдельную комнду
let $PATH .= ';C:\Program Files\Git\bin'

lua vim.cmd.colorscheme "catppuccin-mocha"

"light scheme
"lua vim.cmd.colorscheme "vscode"; vim.o.background = "light";
"lua vim.cmd.colorscheme "github_light_high_contrast"
"lua vim.cmd.colorscheme "catppuccin-latte"
"lua vim.cmd.colorscheme "oxocarbon"; vim.o.background = "light";

"lua vim.cmd.colorscheme "vscode"
"lua vim.cmd.colorscheme "gotham"
"lua vim.cmd.colorscheme "termschool"


"LSP
"Angular
"lua require('my-lsp')

" Mason setup
lua require("mason-config")
lua require("my-lsp")
lua require("telescope-config")

 lua <<EOF
   -- Set up nvim-cmp.
   local cmp = require'cmp'

   cmp.setup({
   -- Add Dadbod complete
   	 vim.api.nvim_create_autocmd({"FileType"}, {
		 pattern = {"sql","mysql","plsql"},
		 callback = function()
		 	require('cmp').setup.buffer({sources = {{ name = 'vim-dadbod-completion' }} } )
		 end
	 }),

     snippet = {
       -- REQUIRED - you must specify a snippet engine
       expand = function(args)
         -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
         -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
       end,
     },
     window = {
		--view = 'wildmenu',
       -- completion = cmp.config.window.bordered(),
       -- documentation = cmp.config.window.bordered(),
     },
     mapping = cmp.mapping.preset.insert({
       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
       ['<C-f>'] = cmp.mapping.scroll_docs(4),
       ['<C-Space>'] = cmp.mapping.complete(),
       ['<C-e>'] = cmp.mapping.abort(),
       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
     }),
     sources = cmp.config.sources({
       { name = 'nvim_lsp' },
       -- { name = 'vsnip' }, -- For vsnip users.
       { name = 'luasnip' }, -- For luasnip users.
       -- { name = 'ultisnips' }, -- For ultisnips users.
       -- { name = 'snippy' }, -- For snippy users.
     }, {
       { name = 'buffer' },
     })
   })
 
   -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
   -- Set configuration for specific filetype.
   --[[ cmp.setup.filetype('gitcommit', {
     sources = cmp.config.sources({
       { name = 'git' },
     }, {
       { name = 'buffer' },
     })
  })
  require("cmp_git").setup() ]]-- 
 
   -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
   cmp.setup.cmdline({ '/', '?' }, {
     mapping = cmp.mapping.preset.cmdline(),
     sources = {
       { name = 'buffer' }
     }
   })
 
   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
   cmp.setup.cmdline(':', {
     mapping = cmp.mapping.preset.cmdline(),
     sources = cmp.config.sources({
       { name = 'path' }
     }, {
       { name = 'cmdline' }
     }),
     matching = { disallow_symbol_nonprefix_matching = false }
   })

   -- Set up lspconfig.
   local capabilities = require('cmp_nvim_lsp').default_capabilities()
   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
   --require('lspconfig')['vimls'].setup {
   --  capabilities = capabilities
   --}
   --require('lspconfig')['tsserver'].setup {
   --  capabilities = capabilities
   --}
   --require('lspconfig')['omnisharp'].setup {
   --  capabilities = capabilities
   --}
 
EOF
