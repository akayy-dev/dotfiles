" Enter plugins here.
call plug#begin('~/.vim/local/share/vim/plugged') "plugin directory

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

"Plugins
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete
Plug 'chriskempson/base16-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'connorholyday/vim-snazzy'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"VIM LATEX
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
call plug#end()




"Plugin Settings

let g:markdown_composer_browser='qutebrowser'

let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

