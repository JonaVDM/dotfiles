filetype plugin on

" set global leader
let mapleader = " "

" Source the plugins
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/standarts.vim
source ~/.config/nvim/secrets.vim
source ~/.config/nvim/keybindings.vim

nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

