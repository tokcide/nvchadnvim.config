local M = {}

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
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
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- config stuff
    "jsonls",
    "taplo",
    "yamlls",

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
