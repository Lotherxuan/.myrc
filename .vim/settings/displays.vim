" set color scheme
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
syntax on
colorscheme onedark

" always show cursor position
set ruler

" highlight current line
set cursorline

" disable auto pop up function type windows
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" something about indent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
:set list lcs=tab:\|\ 
" format c++ using google style will cause indent display differently?
let g:indentLine_enabled = 0

"auto format everytime save buffer
autocmd BufWritePost * :YcmCompleter Format

" something about fold
set foldmethod=syntax
" don't fold when opening vim
set nofoldenable

" enable rainbow plugin
let g:rainbow_active = 1
