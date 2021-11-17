vim.g.mapleader = ' ' -- Set leader keys

local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}

-- Make Capital Y Function Like Capital D
keymap('n', 'Y', 'y$', opts)

-- Toggle Line Numbers
keymap('n', '<leader>n', ':set number!<CR>', opts)
