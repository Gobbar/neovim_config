let mapleader = ";"
" Some ideas
" Place mark on start search point
" nnoremap / ms/
" nnoremap ? ms?
" noremap <leader>k :silent! %bwipe!<cr>

" Some convenience settings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n><C-w>k
" Past from system buffer in command mode
cnoremap <C-v> <C-r>+
" RU normal mode transition mapping
inoremap <C-х> <C-[>
" Only :w only hardcore!
nnoremap ZZ <NOP>
" Fast black hole delete
nnoremap <leader>d "_d
nnoremap <leader>D "_D
cnoremap s/ s/\v

" Create line in normal mode without move
nnoremap <silent> <M-o> :call append('.', '')<CR>
nnoremap <silent> <M-O> :call append(line('.')-1, '')<CR>
inoremap <silent> <M-o> <C-\><C-O>:call append('.', '')<CR>
inoremap <silent> <M-O> <C-\><C-O>:call append(line('.')-1, '')<CR>

" Buffer and tab swap
nnoremap <silent> <leader>b :bn<CR>
nnoremap <silent> <leader>B :bp<CR>
nnoremap <silent> <leader>j :bn<CR>
nnoremap <silent> <leader>k :bp<CR>
nnoremap <silent> <leader>h :tabprevious<CR>
nnoremap <silent> <leader>l :tabnext<CR>

" Highlight mode settings
nnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>?
nnoremap <silent> <C-h> :set invhlsearch<CR>

nnoremap <leader><C-e> :NERDTreeToggle<CR>

"nnoremap <C-]> call codeium#Clear()
"nnoremap <M-]> call coduium#CycleCompletions(1)
"nnoremap <M-[> call codeium#CycleCompletions(-1)
"nnoremap <Tab> call codeium#Accept()
"nnoremap <M-Bslash> call codeium#Complete()

"Asyncomplete
"let g:asyncomplete_auto_poput = 1
"let g:asyncomplete_auto_completeopt = 0

" Git
nnoremap <Leader><C-S-g> :Gdiffsplit<CR>

" Dadbod-ui
nnoremap <Leader><C-D> :DBUIToggle<CR>
nnoremap <Leader><C-Q> :DBUIFindBuffer<CR>

" Telescope
nnoremap <Leader><C-P> :Telescope find_files<CR>
nnoremap <Leader><C-F> :Telescope live_grep<CR>
nnoremap <Leader><C-B> :Telescope buffers<CR>
nnoremap <C-S-P> :Telescope 
nnoremap <Leader><C-B> :Telescope buffers<CR>

" Diffview
nnoremap <Leader><C-G> :DiffviewOpen<CR>

" Oil
nnoremap - :Oil<CR>
