return {
  "saecki/crates.nvim",
  tag = "unstable",
  event = { "BufRead Cargo.toml" },
  dependencies = { "hrsh7th/nvim-cmp", "nvim-lua/plenary.nvim" },
  -- ft = { "rust", "toml" },
  config = function()
    require "configs.crates"
  end,
}
