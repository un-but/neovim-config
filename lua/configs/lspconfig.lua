require("nvchad.configs.lspconfig").defaults()

local servers = { "basedpyright", "ruff" }
vim.lsp.enable(servers)

local lspconfig = require("lspconfig")

vim.diagnostic.config({
  virtual_text = false,
})


lspconfig.basedpyright.setup {
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/basedpyright", "--verbose" },
    filetypes = { "python" },
    root_dir = lspconfig.util.root_pattern(".git", "pyproject.toml"),
    handlers = {
        ["streamChoices"] = function()
            -- Игнорировать ошибку streamChoices с некорректным completionId
        end,
    },
}

lspconfig.ruff.setup {
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/ruff", "server" },
    filetypes = { "python" },
    root_dir = lspconfig.util.root_pattern(".git", "pyproject.toml"),
    settings = {
        args = {}, -- Дополнительные параметры для ruff
    },
}
