"  _ __   ___  _____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _ 
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | | | |  __/ (_) \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |

" Enable Vim-Plug
call plug#begin('~/.vim/plugins/')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Coc Language Integration (plan to switch to lsp when it's more developed)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tab with autocomplete
Plug 'ervandew/supertab'
" Tab chooses the first result instead of the last (the default behavior)
let g:SuperTabDefaultCompletionType = "<c-n>"

" Auto pairing
Plug 'jiangmiao/auto-pairs'

" Treesitter (things like better syntax highlighting)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" Tmux Integration
"" Window Navigation
Plug 'christoomey/vim-tmux-navigator'
"" Sending Commands
Plug 'preservim/vimux'

" NERDTree + Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Snazzy Theme
Plug 'connorholyday/vim-snazzy'

" Git Plugin
Plug 'tpope/vim-fugitive'

call plug#end()

" Enable treesitter's better syntax highlighting
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true} }

" Airline Theme
let g:airline_theme='base16_snazzy'

" Set mapleader key to space
let mapleader=' '

" Split Navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Colorscheme
colorscheme snazzy

" Transparent background
hi Normal guibg=NONE ctermbg=NONE


" Exit if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Sourcing Files
"" Configure Git
source $HOME/.config/nvim/Git.vim
"" Python settings
autocmd BufNewFile,BufRead *.py source $HOME/.config/nvim/code/python.vim
"" Coc Settings
source $HOME/.config/nvim/coc.vim
"" Key Remaps
source $HOME/.config/nvim/remaps.vim


" Programmer Mode
command ProgrammerMode :VimuxOpenRunner | :NERDTreeToggle

" Disable highlighting when searching with /
set nohlsearch

" Consistent UTF-8 Encoding
set encoding=UTF-8

" Vertical splits to the bottom
set splitbelow

" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
