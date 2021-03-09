set noerrorbells
set noswapfile
set nobackup
set number
set nocompatible
set hidden
syntax on
set path+=$PWD/**
set nocp

" set undo file directory
set undodir=~/.vim/undo_dir
set undofile

" all lowercase-> insensitive | one or more uppercase -> sensitive
set ignorecase smartcase 

" make config change take effect right now
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"always show tab information
"set showtabline=2

"always show buffer number
let g:airline#extensions#tabline#enabled = 1

filetype plugin on

" set nerdcommenter default mapping
let g:NERDCreateDefaultMappings = 1

" set auto reread to buffer once file has been modified
set sessionoptions+=globals

" set ycm semantic complete
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

" disable auto add header files
let g:ycm_clangd_args=['--header-insertion=never']
