local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
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
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = nil,
      automatic_installed = true,
    },
    config = function(_, opts)
      require("mason-null-ls").setup(opts)
      require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = require "custom.configs.mason-lspconfig",
  },

  -- override plugin configs
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },

  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      strict = true,
      override_by_filename = {
        [".eslintignore"] = {
          icon = "",
          color = "#4b32c3",
          cterm_color = "56",
          name = "Eslintrc",
        },
      },
    },
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "m4xshen/hardtime.nvim",
    opts = {},
  },
  { "chrisgrieser/nvim-spider", opts = { skipInsignificantPunctuation = true } },
  { "iamcco/markdown-preview.nvim" },
  -- {
  --   "Zeioth/compiler.nvim",
  --   dependencies = {
  --     {
  --       "stevearc/overseer.nvim",
  --       opts = {
  --         task_list = { -- this refers to the window that shows the result
  --           direction = "bottom",
  --           min_height = 25,
  --           max_height = 25,
  --           default_detail = 1,
  --           bindings = {
  --             ["q"] = function()
  --               vim.cmd "OverseerClose"
  --             end,
  --           },
  --         },
  --       },
  --       config = function(_, opts)
  --         require("overseer").setup(opts)
  --       end,
  --     },
  --   },
  --   cmd = { "CompilerOpen", "CompilerToggleResults" },
  --   opts = {},
  -- },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    opts = {
      breadcrumbs = { enable = false, folder_level = 2 },
    },
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end,
  },
}

return plugins
