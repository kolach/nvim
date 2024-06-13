return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup()
      -- require("chatgpt").setup({
      --   api_key_cmd = "op read op://Private/gpt_api_key_nvim/credential --no-newline",
      -- })
    end,
  },
}
