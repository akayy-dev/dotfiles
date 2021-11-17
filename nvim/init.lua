-- Plugins
require('plugins/packer') -- Plugins List
require('plugins/nvim-tree') -- File Tree
require('plugins/lualine') -- Lualine
require('plugins/nvim-compe') -- Compe

-- Keymaps
require('keymaps/general')
require('keymaps/telescope')
require('keymaps/nvim-tree')
require('keymaps/lsp')

-- Code
vim.cmd("autocmd BufNewFile,BufRead *.py lua require('code/python')")
require('plugins/lsprocks')
require('plugins/treesitter')



-- Appearance
require('appearance/theme')
require('appearance/general')
