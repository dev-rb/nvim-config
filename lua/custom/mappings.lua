local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<C-c>"] = "",
  },
}

-- Your custom mappings
M.abc = {
  n = {
    ["<C-h>"] = { "<C-w>h", "Go to left split" },
    ["<C-j>"] = { "<C-w>j", "Go to bottom split" },
    ["<C-k>"] = { "<C-w>k", "Go to top split" },
    ["<C-l>"] = { "<C-w>l", "Go to right split" },
    ["<leader>2"] = { "<C-w>v", "Split right" },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle Transparency",
    },
    ["<leader>cf"] = {
      "<cmd> foldclose <CR>",
      "Fold Region",
    },
    ["<leader>of"] = {
      "<cmd> foldopen <CR>",
      "Unfold Region",
    },
  },
}

return M
