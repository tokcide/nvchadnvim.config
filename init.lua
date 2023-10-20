local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn

vim.opt.relativenumber = true
vim.g.editorconfig = true
vim.g.python_recommended_style = false

-- vscode format i.e json files
-- vim.g.vscode_snippets_path = "./snippets"

--vim.opt_global.expandtab = true
--vim.opt_global.autoindent = true
--vim.opt_global.smarttab = true
--vim.opt_global.shiftwidth = 2
--vim.opt_global.tabstop = 2
-- vim.opt_local.softtabstop = 4
-- vim.opt_local.fileformat = "unix"
-- vim.opt_local.textwidth = 80

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- -- Set indentation to 2 spaces
-- vim.api.nvim_create_augroup("setIndent", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   group = "setIndent",
--   pattern = { "python" },
--   command = "set stabstop=2 shiftwidth=2",
-- })
--
vim.api.nvim_create_augroup("bufcheck", { clear = true })
-- reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "bufcheck",
  pattern = vim.env.MYVIMRC,
  command = "silent source %",
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "bufcheck",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 500 }
  end,
})

-- sync clipboards because I'm easily confused
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "bufcheck",
  pattern = "*",
  callback = function()
    fn.setreg("+", fn.getreg "*")
  end,
})

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  group = "bufcheck",
  pattern = "*",
  command = "startinsert | set winfixheight",
})

-- start git messages in insert mode
vim.api.nvim_create_autocmd("FileType", {
  group = "bufcheck",
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1",
})

-- pager mappings for Manual
vim.api.nvim_create_autocmd("FileType", {
  group = "bufcheck",
  pattern = "man",
  callback = function()
    vim.keymap.set("n", "<enter>", "K", { buffer = true })
    vim.keymap.set("n", "<backspace>", "<c-o>", { buffer = true })
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "bufcheck",
  pattern = "*",
  callback = function()
    if fn.line "'\"" > 0 and fn.line "'\"" <= fn.line "$" then
      fn.setpos(".", fn.getpos "'\"")
      -- vim.cmd('normal zz') -- how do I center the buffer in a sane way??
      vim.cmd "silent! foldopen"
    end
  end,
})

-- Spider mappings
-- vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
-- vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
-- vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
-- vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- Open compiler
vim.api.nvim_buf_set_keymap(0, "n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
-- vim.api.nvim_buf_set_keymap(0, "n", "<S-F6>", function()
--  vim.cmd "CompilerStop" -- (Optional, to dispose all tasks before redo)
--  vim.cmd "CompilerRedo"
--end, { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_buf_set_keymap(0, "n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
