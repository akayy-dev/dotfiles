vim.g.python_recommended_style = false
vim.bo.expandtab = false  -- Use tabs for indentation
vim.opt.wrap = false
vim.opt.number = true
vim.opt.autoindent = true

-- Tab size
vim.opt.tabstop = 4
vim.opt.shiftwidth= 4

-- LSP
require'lspconfig'.pyright.setup{
	single_file_support = true,
}

vim.g.python_reccomended_style = false
