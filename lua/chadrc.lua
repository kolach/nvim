-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/markdownd/NvChad/blob/v2.5/lua/nvconfig.lua

-- ---@type ChadrcConfig
local M = {}

M.ui = {
  nvdash = {
    header = {
      "             (* ,            ",
      "           %#*##/            ",
      "   (#,     #%*#(/.           ",
      "  %#%#(    #%/#((            ",
      "  #(((#    %#(##(    #%%(    ",
      "  %%%#(( .%#(%((     ##(%#,  ",
      "    ##%###%((%##    .%%%#    ",
      "          %#(######%%%#(#.   ",
      "          %#(#####%###.      ",
      "          %#(#(*             ",
      "          %#(#(*     #@      ",
      "   @##    ##(((*    @#@#     ",
      "/////////////////////////////",
    },

    load_on_startup = false,
  },

  cmp = {
    icons = true,
    style = "atom_colored",
  },
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "gopls",
    "gofumpt",
    "goimports-reviser",
    "golines",
    "delve",
    "rust-analyzer",
    "codelldb",
  },
}

-- Here I just moved some originally UI elements to base46
-- as it was recommended by the authors.
M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  cmp = {
    icons = true,
    style = "atom_colored",
  },
}

M.term = {
  sizes = { vsp = 0.5 },
}

return M
