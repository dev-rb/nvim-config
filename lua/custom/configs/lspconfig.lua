local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Unocss
lspconfig.unocss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "javascriptreact", "rescript", "typescriptreact", "vue", "svelte" },
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern(
      "unocss.config.js",
      "unocss.config.ts",
      "uno.config.js",
      "uno.config.ts"
    )(fname)
  end,
}

-- Typescipt
require("typescript").setup {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = {
    -- pass options to lspconfig's setup method
    on_attach = on_attach,
    capabilities = capabilities,
  },
}
local util = require "lspconfig/util"

-- Python
lspconfig.pyright.setup {
  root_dir = function(fname)
    return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
      or util.path.dirname(fname)
  end,
}

local rt = require "rust-tools"

rt.setup {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

-- Golang
lspconfig.gopls.setup {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
