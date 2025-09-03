return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
