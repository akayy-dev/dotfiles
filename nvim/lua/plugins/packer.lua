require('packer').startup(function()
        -- Airline
	use {
		'nvim-lualine/lualine.nvim',                              -- Status Bar
		requires = {'kyazdani42/nvim-web-devicons', opt = true}}  -- Icons
	use 'neovim/nvim-lspconfig' -- LSP
	use 'hrsh7th/nvim-compe' -- LSP Completion Framework
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Treesitter
	use {
	'kyazdani42/nvim-tree.lua', -- File Tree
	requires = 'kyazdani42/nvim-web-devicons',}  -- Icons
	
	--
        -- Tmux Integration
	use 'preservim/vimux' -- Sending Commands
	use 'christoomey/vim-tmux-navigator' -- Navigate Windows
	use 'Mofiqul/vscode.nvim' -- VSCode Theme
	use {
		'nvim-telescope/telescope.nvim',         -- Telescope
		requires = { {'nvim-lua/plenary.nvim'}}} -- Telescope Dependecy 

	-- Completion
	use 'hrsh7th/nvim-compe' -- Completion Framework
	use 'ervandew/supertab'  -- Tab Completion
	use 'tpope/vim-fugitive' -- Git
       -- Project Management
        use {
          "ahmedkhalf/project.nvim",
          config = function()
		require("project_nvim").setup {
			update_cwd = true,
			update_focused_file = {
			enable = true,
			update_cwd = true
            }}
          end}
	use {'norcalli/nvim-colorizer.lua'}

end)
