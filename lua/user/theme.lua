local M = {
	'folke/tokyonight.nvim',
	priority = 1000,
	lazy = false,
	opts = {
		style = 'night',
		transparent = true,
		on_colors = function(colors)
			colors.fg = "#e6eaff"
			colors.fg_dark = "#e6eaff"
			colors.fg_gutter = "#6d728a"
			colors.comment = "#6772a3"
		end,
		on_highlights = function(hl, c)
			local prompt = "#2d3149"
			hl.TelescopeNormal = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopeBorder = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopePromptNormal = {
				bg = prompt,
			}
			hl.TelescopePromptBorder = {
				bg = prompt,
				fg = prompt,
			}
			hl.TelescopePromptTitle = {
				bg = prompt,
				fg = prompt,
			}
			hl.TelescopePreviewTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopeResultsTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
		end,
	},
}

M.name = 'tokyonight-night'
function M.config(_, opts)
	local theme = require 'tokyonight'
	theme.setup(opts)
	vim.cmd.colorscheme 'tokyonight'
	theme.load()
end

return M
