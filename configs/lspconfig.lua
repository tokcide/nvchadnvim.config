local lspconfig = require "lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- local on_attach = lspconfig.on_attach
-- local capabilities = lspconfig.capabilities
--
-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "pyright", "ruff_lsp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
-- }
