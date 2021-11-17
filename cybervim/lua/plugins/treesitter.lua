require'nvim-treesitter.configs'.setup {
	highlight = { enable = true },
	rainbow = {                     -- Rainbow Parentheses
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = {'#FFFFFF', '#FF79C6', '#008080', '#50FA7B', '#F1FA8C', '#FFB86C', '#FF5555'}
	}
}
