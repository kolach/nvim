return {
  {
    "mfussenegger/nvim-dap",
    -- config = function()
    --   require "configs.dap"
    -- end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require "configs.dap-ui"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
}
