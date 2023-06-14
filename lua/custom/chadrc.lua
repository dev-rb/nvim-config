---@type ChadrcConfig
local M = {}

M.ui = { theme = "yoru" }
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
vim.loader.enable()

return M
