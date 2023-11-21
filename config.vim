if has('win64')
	set nohidden	"Фикс свап-файла
	let s:os_sep = '\'
elseif has('unix')
	let s:os_sep = '/'
endif

"Быстрый доступ к конфигурации
let g:config_dir = fnamemodify($MYVIMRC, ':p:h')
:command ConfigFile execute 'e' g:config_dir .. s:os_sep .. 'config.vim'
:command ConfigDir execute 'e' g:config_dir

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"Настройка нумерации и относительной нумерации строк
set number
nnoremap <C-n> :set invrnu<CR>

"Настройка поиска и подсветки поиска
set ignorecase	"Игнорируем регистр при поиске
set smartcase	"Игнорируем регистр при поиске, если все буквы шаблона в одном регистре
set hlsearch	"Подсветка результатов поиска
set incsearch	"Подсветка следующего вхождения шаблона поиска
nnoremap <C-h> :set invhlsearch<CR>

"Настройка отступов
set tabstop=4 "Ширина таба
set shiftwidth=4 "Ширина сдвига 

"Подключение плагинов
call plug#begin(g:config_dir .. s:os_sep .. 'autoload' .. s:os_sep .. 'plugged')
Plug 'preservim/nerdtree'
Plug 'tree-sitter/tree-sitter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
call plug#end()

nnoremap <C-S-e> :NERDTreeToggle %:p:h<CR>
nnoremap <C-S-g> :Gdiffsplit<CR>

