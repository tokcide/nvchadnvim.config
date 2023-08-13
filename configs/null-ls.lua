local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {
  -- default
  b.formatting.shfmt,
  b.formatting.stylua,
  -- webdev
  b.formatting.prettier.with { extra_filetypes = { "toml" } }, -- so prettier works only on these filetypes
  -- python
  b.diagnostics.mypy.with {
    extra_args = function(params)
      local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_DEFAULT_ENV" or "/usr"
      return { "--python-executable", virtual .. "/bin/python" }
    end,
    -- cwd = function(_)
    --   return vim.fn.getcwd()
    -- end,
  },
  b.diagnostics.ruff,
  b.formatting.black,
  b.formatting.isort,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
