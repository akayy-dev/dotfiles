source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/hotkeys.vim
source $HOME/.config/nvim/setsAndTheme.vim
autocmd BufRead,BufNewFile   *.md source $HOME/.config/nvim/markdown.vim "loades the markdown configurations when a markdown file is detected
autocmd BufNewFile,BufRead *.java source $HOME/.config/nvim/java.vim
autocmd BufNewFile,BufRead *.py source $HOME/.config/nvim/python.vim
autocmd BufNewFile,BufRead *.tex source $HOME/.config/nvim/LaTeX.vim
