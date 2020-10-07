call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
let NERDTreeShowHidden=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>
nmap <C-m> :NERDTreeFind<CR>
nmap <leader>p :NERDTreeFind<CR>

" Plugin airline, adds in fancy bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts=1
let g:airline_theme='cobalt2'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1
set noshowmode

" Git commands in vim! Why is this not a default thing
Plug 'tpope/vim-fugitive'

" Commenter, press ,, to make the line a comment
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'

" ,/ to invert comment on the current line/selection
" nmap <leader>/ :call NERDComment(0, "invert")<cr>
" vmap <leader>/ :call NERDComment(0, "invert")<cr>


" Custom icons, says on the website that this should be called last
Plug 'ryanoasis/vim-devicons'

call plug#end()
