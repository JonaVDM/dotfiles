Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

let NERDTreeShowHidden=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>
nmap <leader>p :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['^node_modules$']

" Speed up nerdTree syntax highlight a bit
let g:NERDTreeSyntaxEnabledExtensions = [
      \ '.bmp', '.c', '.coffee', '.cpp', '.css', '.erb', '.go', '.html', '.java',
      \ '.jpg', '.js', '.json', '.jsx',  '.markdown', '.md', '.php', '.png', '.pl',
      \ '.py', '.rb', '.rs', '.scala', '.scss', 'sass', '.sh', '.sql', '.vim',
      \ '.erb', '.exs', 'ex', '.tsx', '.ts'
      \ ]

 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1

