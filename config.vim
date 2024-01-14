"Быстрый доступ к конфигурации
let g:config_dir = fnamemodify($MYVIMRC, ':p:h')
:command ConfigFile execute 'e' g:config_dir .. g:os_sep .. 'config.vim'
:command ConfigDir execute 'e' g:config_dir
:command UpdateConfig execute 'so' g:config_dir .. g:os_sep .. 'config.vim'

"Маппинги для использования vim на русской раскладке
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
inoremap <C-х> <C-[>

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
call plug#begin(g:config_dir .. g:os_sep .. 'autoload' .. g:os_sep .. 'plugged')
Plug 'preservim/nerdtree'
Plug 'tree-sitter/tree-sitter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
call plug#end()

nnoremap <C-S-e> :NERDTreeToggle<CR>

"Вставка из системного буфера обмена в командном режиме
cnoremap <C-v> <C-r>*

"Маппинги терминала
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n><C-w>k

"Работа с системным регистром
:command CopyConfigDir let @* = config_dir

"WIP
"set splitbelow
"set splitright

"Закрыть текущий буфер и сохранить окно
function SwitchAndCloseCurrentBuffer()
	let l:buffnum = bufnr('%')
	bn
	execute 'bd' l:buffnum
endfunction
:command Bd call SwitchAndCloseCurrentBuffer()

nnoremap <C-S-g> :Gdiffsplit<CR>

"Открыть терминал
function MyTermOpen()
	below 20split
	term
	set nonumber
endfunction
nnoremap <C-S-t> :call MyTermOpen()<CR>i

"Добавить Git терминал на отдельную комнду
let $PATH .= ';C:\Program Files\Git\bin'
