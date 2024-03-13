local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- lspconfig.pyright.setup { blabla}
--
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

-- lspconfig.jdtls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   -- cmd = { vim.fn.expand "~/.local/share/nvim/mason/bin/jdtls" },
--   filetypes = { "java" },
-- }

lspconfig.dartls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "dart" },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c" },
  cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "terraform" },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "svelte" },
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
}

lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "Dockerfile", "dockerfile" },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  settings = {
    tsserver = {
      complete = {
        autoImports = true,
        includeCompletionsForModuleExports = true,
      },
      importModuleSpecifierPreference = "relative",
    },
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
    },
  },
}

lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "md", "markdown" },
}
