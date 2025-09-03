return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp", -- for regular expression support
  dependencies = { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load() -- load snippets from friendly-snippets
    local luasnip = require("luasnip")
    luasnip.filetype_extend("vue", { "html" })
  end
}
