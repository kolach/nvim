-- Enable completion using nvim-cmp for crates
local opts = {
  completion = {
    cmp = {
      enabled = true,
    },
  },
}

local crates = require "crates"
crates.setup(opts)

-- TODO: check if show() is still required
-- crates.show()
