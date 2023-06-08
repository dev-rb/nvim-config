-- Fuzzy Finder (files, lsp, etc)
local M = { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }

-- Fuzzy Finder Algorithm which requires local dependencies to be built.
-- Only load if `make` is available. Make sure you have the system
-- requirements installed.
local T = {
	'nvim-telescope/telescope-fzf-native.nvim',
	build = 'make',
	cond = function()
		return vim.fn.executable 'make' == 1
	end,
}
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
M.opts = {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}

function M.config()
	-- Enable telescope fzf native, if installed
	pcall(require('telescope').load_extension, 'fzf')
end


return M, T
