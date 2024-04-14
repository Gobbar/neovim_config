"Neovim specific stuff
language en_US.UTF-8

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
nnoremap <C-m> :set invrnu<CR>

function UpdateNumeration()
	let &l:rnu = mode(1) =~# '^\(no\|v\|V\|\x16\|\)'
	redraw!
endfunction
:au ModeChanged *:* call UpdateNumeration()

"Настройка поиска и подсветки поиска
set ignorecase	"Игнорируем регистр при поиске
set smartcase	"Игнорируем регистр при поиске, если все буквы шаблона в одном регистре
set hlsearch	"Подсветка результатов поиска
set incsearch	"Подсветка следующего вхождения шаблона поиска
nnoremap <C-h> :set invhlsearch<CR>

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
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

"Omnisharp and C# plugins
Plug 'OmniSharp/omnisharp-vim' " After install use :OmniSharpInstall to install LSP server

" Autocompletion
Plug 'prabirshrestha/asyncomplete.vim'

"Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

"Database
"dadbod

"Colorschemes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'whatyouhide/vim-gotham'
"Plug 'Mofiqul/vscode.nvim'
"Plug 'marcopaganini/termschool-vim-theme'
"Plug 'ghifarit53/tokyonight-vim'
call plug#end()

nnoremap <C-S-e> :NERDTreeToggle<CR>

"Вставка из системного буфера обмена в командном режиме
cnoremap <C-v> <C-r>*

"Маппинги терминала
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n><C-w>k

"Работа с системным регистром
:command CopyConfigDir let @* = config_dir

"Codeium
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
let g:asyncomplete_auto_poput = 1
let g:asyncomplete_auto_completeopt = 0

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

nnoremap <C-S-g> :Gdiffsplit<CR>

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
nnoremap <C-S-t> :call MyTermOpen()<CR>

"Telescope find
nnoremap <C-P> :Telescope find_files<CR>
nnoremap <C-S-F> :Telescope live_grep<CR>
nnoremap <C-S-P> :Telescope 

"Добавить Git терминал на отдельную комнду
let $PATH .= ';C:\Program Files\Git\bin'

lua vim.cmd.colorscheme "catppuccin"
"lua vim.cmd.colorscheme "vscode"
"lua vim.cmd.colorscheme "gotham"
"lua vim.cmd.colorscheme "termschool"


"LSP
"Angular
lua require('my-lsp')

