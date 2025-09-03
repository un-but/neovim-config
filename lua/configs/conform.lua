return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "pydocstyle" },
    c = { "clang-format" },
    cpp = { "clang-format" },

    javascript = { "prettier" },
    typescript = { "prettier" },
    vue = { "prettier" },

    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    -- add more filetypes and their formatters as needed
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
