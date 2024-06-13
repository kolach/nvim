return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = { "hrsh7th/nvim-cmp", "folke/trouble.nvim" },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "configs.copilot"
    end,
  },
}
