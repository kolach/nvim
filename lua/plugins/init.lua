return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "rust",
        "go",
        "markdown",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = true,
      },
      { "saecki/crates.nvim" },
    },
    config = function()
      require "configs.cmp"
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = "rust",
    opts = function()
      require "configs.rustaceanvim"
    end,
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("force", vim.g.rustaceanvim or {}, opts or {})
    end,
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require("trouble").setup(opts)
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup {
        callbacks = {
          ["gitlab.nxlog.company"] = require("gitlinker.hosts").get_gitlab_type_url,
        },
      }
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    opts = {
      provider = "openai",
    },
    build = "make",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "grapp-dev/nui-components.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim",
        },
      },
      "nvim-lua/plenary.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
  },
}
