require("nvchad.configs.lspconfig").defaults()

local servers = { "basedpyright", "ruff" }
vim.lsp.enable(servers)

local lspconfig = require("lspconfig")

vim.diagnostic.config({
  virtual_text = false,
})


-- Lua setup

lspconfig.lua_ls.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
  filetypes = { "lua" },
  root_dir = lspconfig.util.root_pattern(".git", ".luarc.json", ".luacheckrc"),
}


-- Python setup

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


-- JavaScript/TypeScript (Vue) setup

lspconfig.ts_ls.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
}

lspconfig.eslint.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json", ".git"),
}

lspconfig.html.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server", "--stdio" },
  filetypes = { "html", "vue" },
  root_dir = lspconfig.util.root_pattern(".git", "package.json"),
  init_options = {
    configurationSection = { "html", "javascript", "typescript" },
    embeddedLanguages = {
      javascript = true,
      css = true,
    },
  },
}

lspconfig.cssls.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less", "vue" },
  root_dir = lspconfig.util.root_pattern(".git", "package.json"),
}

lspconfig.volar.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js", ".git"),
  settings = {
    vue = {
      format = {
        enable = true,
        options = {
          tabSize = 4,
          useTabs = false,
        },
      },
      completion = {
        autoImport = true,
        useScaffoldSnippets = true,
      },
      codeActions = {
        enable = true,
      },
      diagnostics = {
        enable = true,
      },
    },
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}


-- C/C++ setup

lspconfig.clangd.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json"),
}


-- Some filetypes setup

lspconfig.jsonls.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_dir = lspconfig.util.root_pattern(".git", "package.json"),
}

lspconfig.dockerls.setup {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/docker-language-server", "--stdio" },
  filetypes = { "dockerfile" },
  root_dir = lspconfig.util.root_pattern(".git", "Dockerfile"),
}
