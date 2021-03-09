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

" provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

" provides dot command(.) for plugins
Plug 'tpope/vim-repeat'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

" ycm
Plug 'ycm-core/YouCompleteMe'

" quick comment
Plug 'preservim/nerdcommenter'

" nerd tree
Plug 'preservim/nerdtree'

" better display indent
Plug 'Yggdroot/indentLine'

" rainbow brackets
Plug 'luochen1990/rainbow'

" show bookmarks
Plug 'kshenoy/vim-signature'

" provide build-in terminal like vscode
Plug 'skywind3000/vim-terminal-help'

" auto pairs
Plug 'jiangmiao/auto-pairs'
call plug#end()

