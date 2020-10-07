call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
let NERDTreeShowHidden=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>
nmap <leader>p :NERDTreeFind<CR>

" Plugin airline, adds in fancy bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts=1
let g:airline_theme='cobalt2'
let g:airline_solarized_bg='dark'
let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = 'Hello'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0

set noshowmode

" Git commands in vim! Why is this not a default thing
Plug 'tpope/vim-fugitive'

" Control :P
Plug 'ctrlpvim/ctrlp.vim'
" Ignore things that are in the gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" You Comlete me!
Plug 'ycm-core/YouCompleteMe'

" Fancy colors on the file tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" syntax support for some things
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mmalecki/vim-node.js'

" Spotify
Plug 'HendrikPetertje/vimify'

" Custom icons, says on the website that this should be called last
Plug 'ryanoasis/vim-devicons'

call plug#end()
