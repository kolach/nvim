-- Possible configurable fields can be found on:
-- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
local opts = {
  suggestion = {
    enable = true,
  },
  panel = {
    enable = false,
  },
}

require("copilot").setup(opts)
