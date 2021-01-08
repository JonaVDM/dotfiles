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
set shortmess+=c

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

syntax enable
set background=dark
colorscheme gruvbox

set ts=4
set sw=4
set et

" highlight! link SignColumn LineNr

