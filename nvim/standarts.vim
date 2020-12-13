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

let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

set ts=2                " number of spaces in a tab
set sw=2                " number of spaces for indent
set et                  " expand tabs into spaces

highlight! link SignColumn LineNr

