" Theming
let g:airline_theme='base16_snazzy'
"let g:airline_powerline_fonts = 1
set background=dark
colorscheme snazzy


" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



"general sets
set autochdir
set shiftwidth=2
set encoding=UTF-8
set nohlsearch
set splitbelow
set tabstop=2
set completefunc=emoji#complete


"lets
let mapleader=" "
let g:vimspector_enable_mappings = 'HUMAN'
