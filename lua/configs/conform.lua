return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "pydocstyle" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    -- add more filetypes and their formatters as needed
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

