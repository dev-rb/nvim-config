local M = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

function M.config()
	vim.keymap.set('n', '<C-_>', ":NvimTreeToggle<CR>")
	vim.keymap.set('n', '<C-e>', ":NvimTreeFocus<CR>")
	require("nvim-tree").setup({
		view = {
			side = "right",
		},
		on_attach = function(bufnr)
			local api = require 'nvim-tree.api'
			api.config.mappings.default_on_attach(bufnr)
		end
	})
end

return M
