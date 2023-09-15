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

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = nil,
      automatic_installation = true,
    },
    config = function(_, opts)
      require "custom.configs.null-ls"
      require("mason-null-ls").setup(opts)
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
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      -- Add "oil" to the disabled_filetypes
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
    },
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    opts = {
      skipInsignificantPunctuation = true,
    },
  },
  { "iamcco/markdown-preview.nvim" },
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "19aac0426710c8fc0510e54b7a6466a03a1a7377",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
        bindings = {
          ["q"] = function()
            vim.cmd "OverseerClose"
          end,
        },
      },
    },
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
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("leetbuddy").setup {}
    end,
    keys = {
      { "<leader>lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
      { "<leader>ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
      { "<leader>lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
      { "<leader>lt", "<cmd>LBTest<cr>", desc = "Run Code" },
      { "<leader>ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
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
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension "lazygit"
    end,
  },

  { "b0o/schemastore.nvim" },
  { "ThePrimeagen/vim-be-good", cmd = { "VimBeGood" } },
}

return plugins
