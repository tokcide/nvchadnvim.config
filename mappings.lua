---@type MappingsTable
local M = {}

local spider_bindings = {
  ["w"] = { "<cmd>lua require('spider').motion('w')<CR>", "Spider-w" },
  ["e"] = { "<cmd>lua require('spider').motion('e')<CR>", "Spider-e" },
  ["b"] = { "<cmd>lua require('spider').motion('b')<CR>", "Spider-b" },
  ["ge"] = { "<cmd>lua require('spider').motion('ge')<CR>", "Spider-ge" },
}
-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<C-a>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.spider = {
  n = spider_bindings,
  o = spider_bindings,
  x = spider_bindings,
}
return M
