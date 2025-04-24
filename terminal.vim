" Открыть терминал
function MyTermOpen()
	tabnew terminal
	terminal
	setlocal bufhidden=hide
	setlocal nobuflisted
"	if !exists('t:TerminalBuffer')
"		below 15split
"		term
"		setlocal nonumber
"		setlocal bufhidden=hide
"		setlocal nobuflisted
"		execute 'file' 'cmd'
"		let t:TerminalBuffer = bufnr('%')
"		return
"	endif
"
"	let l:winnr = bufwinnr(t:TerminalBuffer)
"	if l:winnr !=# -1 
"		"call win_gotoid(l:winnr)
"		exec l:winnr . 'hide'
"	else
"		below 15split
"		execute 'b' t:TerminalBuffer	
"	endif

"	if currentwindow = 'term'
"		i
"	endif
endfunction
nnoremap <silent> <leader><C-T> :call MyTermOpen()<CR>

