require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- This will make Neovim recognize files with the .http extension as HTTP files.
vim.filetype.add {
  extension = {
    ["http"] = "http",
  },
}
