"Neovim specific stuff
language en_US.UTF-8

" Main config and OS-specific stuff
if has('win64')
	set nohidden	" Swap file error fix (I dunno what it means, lol)
	" Setup powershell
	let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
	let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
	let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
	set shellquote= shellxquote=
endif

" RU to EN layout mapping
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Some convenience settings
set nowrap
set number
set scrolloff=2
set tabstop=4
set shiftwidth=4
" Search and highlight
set ignorecase	"Игнорируем регистр при поиске
set smartcase	"Игнорируем регистр при поиске, если все буквы шаблона в одном регистре
set hlsearch	"Подсветка результатов поиска
set incsearch	"Подсветка следующего вхождения шаблона поиска

" Relative number on active window of normal mode
:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave,WinEnter,CmdlineLeave * if &nu && mode() != "i" | set rnu | redraw! | endif
:	autocmd BufLeave,FocusLost,InsertEnter,WinLeave,CmdlineEnter * if &nu | set nornu | endif
:augroup END
nnoremap : :set nornu<CR>:

" Close buffer and save window
function SwitchAndCloseCurrentBuffer()
	let l:buffnum = bufnr('%')
	bn
	execute 'bd' l:buffnum
endfunction
:command Bd call SwitchAndCloseCurrentBuffer()

" Configuration fast access
let g:config_dir = fnamemodify($MYVIMRC, ':p:h')
:command ConfigFile execute 'e' g:config_dir .. '/init.vim'
:command MappingFile execute 'e' g:config_dir .. '/map.vim'
:command ConfigDir execute 'e' g:config_dir
:command UpdateConfig execute 'so' g:config_dir .. '/init.vim'
" Copy path to configuration to system register
:command CopyConfigDir let @* = config_dir

"Codeium

execute 'source ' .. g:config_dir .. '/plugin.vim'

" Plugin stuff
let g:db_ui_execute_on_save = 0
let g:searchindex_line_limit=2000000
let g:codeium_enabled = v:false
let g:codeium_path = g:config_dir .. '/codeium_api'
let g:codeium_manual = v:true

execute 'source ' .. g:config_dir .. '/map.vim'
lua require("init")
