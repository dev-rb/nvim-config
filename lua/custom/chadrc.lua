---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvchad",
  statusline = { theme = "minimal", separator_style = "round" },
  tabufline = { enabled = false },
  nvdash = { load_on_startup = false },
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
vim.loader.enable()

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

return M
