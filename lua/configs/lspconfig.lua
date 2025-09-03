require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common root_dir patterns
local root_pattern = lspconfig.util.root_pattern

vim.diagnostic.config({
  virtual_text = false,
})


-- Lua setup

lspconfig.lua_ls.setup {
  filetypes = { "lua" },
  root_dir = root_pattern(".git", ".luarc.json", ".luacheckrc", ".luarc.jsonc"),
  capabilities = cmp_capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.api.nvim_get_runtime_file("?.lua", true),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}


-- Python setup

lspconfig.basedpyright.setup {
  filetypes = { "python" },
  root_dir = root_pattern(".git", "pyproject.toml", "setup.cfg", "requirements.txt", "Pipfile", "tox.ini"),
  capabilities = cmp_capabilities,
  handlers = {
    ["streamChoices"] = function() end, -- streamChoices disabled
  },
}

lspconfig.ruff.setup {
  filetypes = { "python" },
  root_dir = root_pattern(".git", "pyproject.toml", "setup.cfg", "requirements.txt", "Pipfile", "tox.ini"),
  capabilities = cmp_capabilities,
  settings = {
    args = {}, -- Add your custom arguments here
  },
}


-- JavaScript/TypeScript (Vue) setup

lspconfig.ts_ls.setup {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = root_pattern("tsconfig.json", "jsconfig.json", "package.json", "vite.config.js", "webpack.config.js", "next.config.js", ".git"),
  capabilities = cmp_capabilities,
}

lspconfig.eslint.setup {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  root_dir = root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", "package.json", ".git"),
  capabilities = cmp_capabilities,
}

lspconfig.html.setup {
  filetypes = { "html", "vue" },
  root_dir = root_pattern("index.html", ".git", "package.json", "vite.config.js", "webpack.config.js"),
  capabilities = cmp_capabilities,
}

lspconfig.cssls.setup {
  filetypes = { "css", "scss", "less", "vue" },
  root_dir = root_pattern("index.html", ".git", "package.json", "vite.config.js", "webpack.config.js"),
  capabilities = cmp_capabilities,
}

lspconfig.volar.setup {
  filetypes = { "vue" },
  root_dir = root_pattern("package.json", "vue.config.js", "vite.config.js", "nuxt.config.js", ".git"),
  capabilities = cmp_capabilities,
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
}

-- C/C++ setup
lspconfig.clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = root_pattern("compile_commands.json", "compile_flags.txt", "CMakeLists.txt", "Makefile", ".git"),
  capabilities = cmp_capabilities,
}

-- Some filetypes setup
lspconfig.jsonls.setup {
  filetypes = { "json", "jsonc" },
  root_dir = root_pattern(".git", "package.json"),
  capabilities = cmp_capabilities,
}
