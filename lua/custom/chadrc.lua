---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "rxyhn",
  statusline = { theme = "minimal", separator_style = "round" },
  tabufline = { enabled = false },
  nvdash = { load_on_startup = false },
}
require "custom.statuscolumn"
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
vim.loader.enable()

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
return M
