-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/markdownd/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = { "catppuccin", "one_light" },
  theme = "catppuccin",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

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
      "///////////////////////////  ",
    },

    load_on_startup = false,
  },

  cmp = {
    icons = true,
    style = "atom_colored",
  },
}

return M
