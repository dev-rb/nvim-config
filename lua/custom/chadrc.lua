---@type ChadrcConfig
local M = {}

M.ui = { theme = "tokyodark" }
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
vim.loader.enable()

return M
