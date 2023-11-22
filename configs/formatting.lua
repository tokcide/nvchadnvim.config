return {
  formatters_by_ft = {
    lua = { "stylua" },
    json = { "prettierd" },
    toml = { "taplo" },
    yaml = { "prettier" },
    sh = { "shfmt" },
    python = { "isort", { "black", "yapf" } },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { "prettierd" },
  },
  format_on_save = { async = false, timeout_ms = 500, lsp_fallback = true },
}
