local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}


keymap('n', '<leader>p', ':NvimTreeToggle<CR>', opts)
