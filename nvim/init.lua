-- Plugins
require('plugins/packer') -- Plugins List
require('plugins/nvim-tree') -- File Tree
require('plugins/lualine') -- Lualine
require('plugins/nvim-compe') -- Compe

-- Keymaps
require('keymaps/general')
require('keymaps/telescope')
require('keymaps/nvim-tree')

-- Code
require('code/general')
vim.cmd('autocmd BufNewFile,BufRead *.py lua require(\'code/python\')')

-- Appearance
require('appearance/theme')



