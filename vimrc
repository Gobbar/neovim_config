"Vim specific stuff
"Тишина
set t_vb=
set visualbell t_vb=
"Main config and OS-specific stuff
if has('win64')
	let g:os_sep = '\'
elseif has('unix')
	let g:os_sep = '/'
endif
execute 'source' fnamemodify($MYVIMRC, ':p:h') .. g:os_sep .. 'config.vim'
