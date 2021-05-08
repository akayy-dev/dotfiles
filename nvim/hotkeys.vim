" Enter vim hotkeys

" Split Navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


"FZF File Search Hotkey
nmap <C-f> :Files <CR>

"Save Key
inoremap <C-s> <ESC> :w <CR> i

"Toggle NERDTree
nnoremap <space>p :NERDTreeToggle<CR>

"Toggle line numbers
noremap <space>n :set number!<CR>

"Vim Programmer Mode
command ProgrammerMode :split +terminal | :resize 10 | :NERDTreeToggle
