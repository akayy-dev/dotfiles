
local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}

keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<cr>', opts)
keymap('n', '<F2>', '<cmd>Lspsaga rename<cr>', opts)
