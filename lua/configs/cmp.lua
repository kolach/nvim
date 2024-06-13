local cmp = require "cmp"

local opts = require "nvchad.configs.cmp"

-- completion setup for SQL queries
cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})

-- cmp.setup.filetype({ "toml" }, {
--   sources = {
--     { name = "crates" },
--   },
-- })

table.insert(opts.sources, { name = "crates" })
table.insert(opts.sources, { name = "copilot", group_index = 2 })

cmp.setup(opts)
