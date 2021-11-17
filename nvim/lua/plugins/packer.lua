require('packer').startup(function()
	use 'neovim/nvim-lspconfig'             -- LSP
	use 'hrsh7th/nvim-compe'                -- LSP Completion Framework
	use 'glepnir/lspsaga.nvim'              -- LSP Frontend
	use 'hrsh7th/nvim-compe'                -- Completion Framework
	use 'ervandew/supertab'                 -- Tab Completion
	use 'tpope/vim-fugitive'                -- Git
	use 'norcalli/nvim-colorizer.lua'       -- Colorizer
	use 'preservim/vimux'                   -- Sending Commands
	use 'christoomey/vim-tmux-navigator'    -- Navigate Windows
	use 'Mofiqul/vscode.nvim'               -- VSCode Theme
	use 'p00f/nvim-ts-rainbow'              -- Rainbow Parentheses
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Treesitter
	use {'kyazdani42/nvim-tree.lua',                  -- File Tree
	requires = 'kyazdani42/nvim-web-devicons'}        -- Icons
	use { 'lewis6991/gitsigns.nvim',                  -- Git Gutter
	requires = { 'nvim-lua/plenary.nvim' },
		config = function()
		require('gitsigns').setup()
		end
		}
	
	use {
		'nvim-lualine/lualine.nvim',                              -- Status Bar
		requires = {'kyazdani42/nvim-web-devicons', opt = true}}  -- Icons
        -- Tmux Integration

	use {
		'nvim-telescope/telescope.nvim',         -- Telescope
		requires = { {'nvim-lua/plenary.nvim'}}} -- Telescope Dependecy 
       -- Project Management
        use {
		"ahmedkhalf/project.nvim",
          	config = function()
		require("project_nvim").setup {
			update_cwd = true,
			update_focused_file = {
			enable = true,
			update_cwd = true }}
          end}
end)
