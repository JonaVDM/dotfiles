filetype plugin on
syntax enable

set nowrap
set number
set numberwidth=3
set showcmd
set showmatch
set ruler
set wildmenu
set autoindent
set colorcolumn=80
set scrolloff=5
set noshowmode
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300

set ts=4
set sw=4

call plug#begin('~/.config/nvim/plugged')

" Show a fancy bar
Plug 'vim-airline/vim-airline'

" Show git changes in a file
Plug 'airblade/vim-gitgutter'

" Control P action
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Auto close tags
Plug 'Raimondi/delimitMate'

" Comment with ctr+/
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCreateDefaultMappings = 0
nmap <silent>, <plug>NERDCommenterInvert 
xmap <silent>, <plug>NERDCommenterInvert 

" Language support/syntax
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" let g:go_fmt_command = "goimports"
" let g:go_def_mapping_enabled = 0
Plug 'pangloss/vim-javascript'
Plug 'mmalecki/vim-node.js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
  " \ 'coc-go',

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" File tree
Plug 'preservim/nerdtree'
let NERDTreeShowHidden=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <silent>P :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['^node_modules$']

function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" All extentions must be called before this point
call plug#end()

" Use ctr + hjkl to move between splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
