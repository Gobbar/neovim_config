"Neovim specific stuff
language en_US

"Main config and OS-specific stuff
if has('win64')
	set nohidden	"Фикс свап-файла
	let g:os_sep = '\'
elseif has('unix')
	let g:os_sep = '/'
endif
execute 'source' fnamemodify($MYVIMRC, ':p:h') .. g:os_sep .. 'config.vim'
