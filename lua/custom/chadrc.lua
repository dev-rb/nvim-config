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

return M
