vim.opt.wrap = false
vim.opt.number = true
vim.opt.autoindent = true

-- Tab size
vim.opt.tabstop = 4
vim.opt.shiftwidth= 4

-- LSP
require'lspconfig'.pyright.setup{}
