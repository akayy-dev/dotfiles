local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}

keymap('n', '<leader>gs', '<cmd>Git<cr>', opts)
keymap('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', opts)
