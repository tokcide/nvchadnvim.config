local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- LSP plugins
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    event = "VeryLazy",
    opts = require "custom.configs.mason-installer",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "b0o/schemastore.nvim",
    },
    opts = require "custom.configs.mason-lspconfig",
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    cmd = { "ConformInfo" },
    opts = require "custom.configs.formatting",
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = require "custom.configs.linting",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_enable = true, -- disable hints as it will crash in some terminal
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    },
  },
  -- override plugin configs
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },

  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  -- To make a plugin not be loaded
  {
    "nvchad/nvim-colorizer.lua",
    enabled = false,
  },
  -- KEYMAP plugins
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    opts = {
      skipInsignificantPunctuation = true,
    },
  },
  {
    "booperlv/nvim-gomove",
    event = { "BufReadPre", "BufNewFile" },
    opts = { -- whether or not to map default key bindings, (true/false)
      map_defaults = true,
      -- whether or not to reindent lines moved vertically (true/false)
      reindent = true,
      -- whether or not to undojoin same direction moves (true/false)
      undojoin = true,
      -- whether to not to move past end column when moving blocks horizontally, (true/false)
      move_past_end_col = false,
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    opts = require "custom.configs.lspsaga",
  },
  {
    "aspeddro/gitui.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require("gitui").setup(opts)
    end,
    keys = {
      {
        "<leader>gg",
        function(_, keys)
          require("gitui").open()
        end,
        desc = "View GitUi window",
      },
    },
  },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  { "ThePrimeagen/vim-be-good", cmd = { "VimBeGood" } },
}

return plugins
