-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local barbar = {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
	},
	init = function() vim.g.barbar_auto_setup = true end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
		autohide = false,
		letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP', --
	},
	config = function()
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
	end,
	version = '^1.0.0', -- optional: only update when a new 1.x version is released
}

local lastplace = {
	'ethanholz/nvim-lastplace',
	config = function()
		require 'nvim-lastplace'.setup({})
	end,
}

return {
	barbar,
	lastplace
}
