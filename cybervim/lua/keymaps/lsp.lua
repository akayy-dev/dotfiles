
local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}

keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<cr>', opts)
keymap('n', '<F2>', '<cmd>Lspsaga rename<cr>', opts) -- Rename
keymap('n', 'gR', '<cmd>Lspsaga rename<cr>', opts)   -- Rename for terminal without access to the F2 key
keymap('n', 'gd', '<cmd>Lspsaga preview_definition<cr>', opts)
