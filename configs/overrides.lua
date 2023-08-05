local M = {}

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
    -- bash
    "bash",
    -- webdev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    -- config
    "json",
    "jsonc",
    "toml",
    "yaml",

    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server", --lua language-server
    "stylua", -- lua formatter
    "bashls", -- bash language-server
    "shfmt", -- bash formatter
    "shellcheck", --bash linter
    "jsonls", --json language-server
    "taplo", -- toml language-server
    "yamlls", -- yaml language-server

    -- web dev stuff
    "typescript-language-server",
    "html-lsp",
    "css-lsp",
    "prettier",

    -- python
    "pyright",
    "ruff",
    "mypy",
    "yapf",
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
