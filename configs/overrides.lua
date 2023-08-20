local M = {}

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
    "bash",
    -- config
    "json",
    "jsonc",
    "toml",
    "yaml",
    -- webdev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "python",
  },
  indent = {
    enable = true,
    disable = {
      -- "python",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- language-server
    "lua-language-server", --lua language-server
    "bash-language-server", -- bash language-server
    "json-lsp", --json language-server
    "taplo", -- toml language-server
    "yaml-language-server", -- yaml language-server
    "html-lsp", -- html
    "css-lsp", -- css
    "typescript-language-server", -- ts
    "pyright", -- python
    -- formatter
    "stylua", -- lua
    "shfmt", -- bash
    "prettier", -- webdev
    -- "black",
    -- "isort", -- python
    --linter
    "shellcheck", --bash
    "ruff-lsp",
    "pyright",
    -- "mypy",
  },
}

M.mason_lspconfig = { -- uses lspconfig server names
  ensure_installed = {
    "rust_analyzer",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
