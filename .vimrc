" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" one dark theme
Plug 'joshdick/onedark.vim'

" offer syntax and indentation support
Plug 'sheerun/vim-polyglot'

" status/tabline for vim
Plug 'vim-airline/vim-airline'

" additional vim c++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

source $HOME/.vim/settings/plugins.vim
source $HOME/.vim/settings/configs.vim
source $HOME/.vim/settings/functions.vim
source $HOME/.vim/settings/mappings.vim
source $HOME/.vim/settings/displays.vim

