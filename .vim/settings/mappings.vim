inoremap qq <esc>

" set a breakpoint when delete a word or some text
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" set leader mapping to ;
"let g:mapleader=";"
let g:mapleader="\<space>"

" set silent mapping to operate on buffers" 
nnoremap <silent> <space>3 :bnext<return>
nnoremap <silent> <space>2 :bprevious<return>
nnoremap <silent> <space>1 :bdelete<return>
nnoremap <silent> <space>4 :enew<return>

" map esc to cancel highlight after serach
" don't use uh! this will cause every time undo take a long time to take
" effect!
" nnoremap <silent> uh :noh<return><esc>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" save and quit
nmap <Leader>w :w<return>
nmap <Leader>q :q<return>

" format binding to YCM
nnoremap <Leader>f :YcmCompleter Format<return>

" quick jump out of pairs
inoremap qw <esc>la
