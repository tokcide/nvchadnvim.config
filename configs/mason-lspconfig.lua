local lspconfig = require "lspconfig"
local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities
return {
  automatic_installation = { exclude = "clangd" },
  ensure_installed = {
    "html",
    "cssls",
    "tsserver",
    "pyright",
    "ruff_lsp",
  },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
    ["ruff_lsp"] = function()
      lspconfig.ruff_lsp.setup {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          client.server_capabilities.hoverProvider = false
        end,
        capabilities = capabilities,
        filetypes = { "python" },
      }
    end,
  },
}
