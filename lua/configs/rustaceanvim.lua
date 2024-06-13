local configs = require "nvchad.configs.lspconfig"
local on_attach = configs.on_attach

local options = {
  tools = {},

  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        inlayHints = {
          enable = true,
          typeHints = true,
          parameterHints = true,
          chainingHints = true,
          maxLength = 100,
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
  },
  -- Does not work for some reason
  -- dap = {
  --   configuration = {
  --     initCommands = {
  --       "command script import ~/.lldbinit",
  --     },
  --   },
  -- },
}

return options
