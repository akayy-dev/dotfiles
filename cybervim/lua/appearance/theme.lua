-- Fix Pink Completion issue
vim.cmd[[
hi Pmenu ctermbg=NONE ctermfg=NONE
hi PmenuSel ctermbg=NONE ctermfg=NONE
]]

vim.g.vscode_style = "dark"
vim.cmd('colorscheme vscode')
