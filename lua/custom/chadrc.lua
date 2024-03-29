---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everblush",
  statusline = { theme = "minimal", separator_style = "round" },
  tabufline = { enabled = false },
  nvdash = { load_on_startup = false },
  lsp_semantic_tokens = true,
  hl_add = {
    ["IlluminatedWordText"] = { link = "Visual", underline = false },
    ["IlluminatedWordRead"] = { link = "Visual", underline = false },
    ["IlluminatedWordWrite"] = { link = "Visual", underline = false },
  },
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
vim.g.skip_ts_context_commentstring_module = true
vim.opt.swapfile = false

vim.diagnostic.config {
  virtual_text = true,
}
return M
