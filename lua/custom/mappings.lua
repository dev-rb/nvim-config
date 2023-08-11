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
    ["<C-h>"] = {
      function()
        require("smart-splits").move_cursor_left()
      end,
      "Go to left split",
    },
    ["<C-j>"] = {
      function()
        require("smart-splits").move_cursor_down()
      end,
      "Go to bottom split",
    },
    ["<C-k>"] = {
      function()
        require("smart-splits").move_cursor_up()
      end,
      "Go to top split",
    },
    ["<C-l>"] = {
      function()
        require("smart-splits").move_cursor_right()
      end,
      "Go to right split",
    },
    ["<leader>2"] = { "<C-w>v", "Split right" },
    ["<leader>x"] = { "<Cmd> :bp|bd# <CR>", "Close Buffer" },
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
