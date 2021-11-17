local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}

-- Telescope
keymap('n', '<space>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
keymap('n', '<leader>f;', ':Telescope<CR>', opts)

-- Git
keymap('n', '<leader>fGf', 'Telescope git_files', opts)
keymap('n', '<leader>fGb', 'Telescope git_branches', opts)
