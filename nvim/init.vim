"vim markdown function (REQUIRED)

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.vim/plugins/')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Coc Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"NERDTree + Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Snazzy Theme
Plug 'connorholyday/vim-snazzy'

" Markdown
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'dhruvasagar/vim-table-mode'

" Git Plugin
Plug 'tpope/vim-fugitive'

call plug#end()

" Airline Theme
let g:airline_theme='base16_snazzy'

" Set mapleader key to space
let mapleader=' '

" Split Navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Toggle NERDTree
nnoremap <space>p :NERDTreeToggle<CR>

"Toggle line numbers
noremap <space>n :set number!<CR>

" Colorscheme
colorscheme snazzy

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Load custom Git config if Neovim is opened in a repository
if isdirectory(".git")
	echo "Git repository detected"
	source $HOME/.config/nvim/Git.vim
else
	echo "Welcome to Neovim!"
endif

" Exit if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"Python Hard Tabs
autocmd BufNewFile,BufRead *.py	set autoindent noexpandtab tabstop=4 shiftwidth=4

" Disable text wrapping
autocmd BufNewFile,BufRead *.py	set nowrap


" LaTeX settings
autocmd BufNewFile,BufRead *.tex source $HOME/.config/nvim/LaTeX.vim

" Markdown settings
autocmd BufNewFile,BufRead *.md source $HOME/.config/nvim/markdown.vim

" Programmer Mode
command ProgrammerMode :5sp +terminal | :NERDTreeToggle

" Disable highlighting when searching with /
set nohlsearch

" Consistent UTF-8 Encoding
set encoding=UTF-8

" Vertical splits to the bottom
set splitbelow
