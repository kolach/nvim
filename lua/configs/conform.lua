local options = {
  formatters = {
    prettier = {
      command = "prettier",
      args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
      rootPatterns = { ".prettierrc", ".prettierrc.json", ".prettierrc.js", "package.json" },
      stdin = true,
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    jsx = { "prettier" },
    javascript = { "prettier" },
    rust = { "rustfmt" },
  },

  -- format_on_save = false,
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
