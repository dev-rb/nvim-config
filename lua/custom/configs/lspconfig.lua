local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local custom_on_attach = function(client, buf)
  on_attach(client, buf)
  -- if client.supports_method "textDocument/inlayHint" then
  --   vim.lsp.inlay_hint.enable(buf, true)
  -- end
end

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      hint = { enable = true },
    },
  },
}

-- MDX
lspconfig.mdx_analyzer.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

-- Unocss
-- https://github.com/xna00/unocss-language-server/issues/8
lspconfig.unocss.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = { "html", "javascriptreact", "rescript", "typescriptreact", "vue", "svelte", "typescript.tsx" },
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
    on_attach = custom_on_attach,
    capabilities = capabilities,
    -- init_options = {
    --   preferences = {
    --     includeInlayParameterNameHints = "none",
    --     includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    --     includeInlayFunctionParameterTypeHints = false,
    --     includeInlayVariableTypeHints = true,
    --     includeInlayPropertyDeclarationTypeHints = true,
    --     includeInlayFunctionLikeReturnTypeHints = true,
    --     includeInlayEnumMemberValueHints = true,
    --     importModuleSpecifierPreference = "non-relative",
    --   },
    -- },
  },
}
-- lspconfig.eslint.setup {
--   on_attach = custom_on_attach,
--   capabilities = capabilities,
-- }
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
    on_attach = custom_on_attach,
    capabilities = capabilities,
  },
}

-- Golang
lspconfig.gopls.setup {
  server = {
    on_attach = custom_on_attach,
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
require("go").setup {
  lsp_cfg = {
    on_attach = custom_on_attach,
    capabilities = capabilities,
    -- other setups
  },
}
