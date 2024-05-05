---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },

  -- To find any highlight groups: "<cmd> Telescope highlights"
  -- Each highlight group can take a table with variables fg, bg, bold, italic, etc
  -- base30 variable names can also be used as colors

  -- -@type HLTable
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
  -- -@type Base46HLGroupsList
  hl_override = {
    Comment = {
      italic = true,
    },
  },

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = { "notify", "alpha" }, -- these aren't compiled by default, ex: "alpha", "notify"

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
    selected_item_bg = "simple", -- colored / simple
  },

  cheatsheet = {
    theme = "grid",
  },

  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "default",
    overriden_modules = nil,
  },

  tabufline = {
    lazyload = true,
    overriden_modules = nil,
  },
  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
