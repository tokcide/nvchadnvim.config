local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn

-- vim.o.shell = "zsh"

vim.opt.relativenumber = true
vim.g.editorconfig = true

vim.cmd "set expandtab"
vim.cmd "set tabstop=2"
vim.cmd "set softtabstop=2"
vim.cmd "set shiftwidth=2"
vim.cmd "autocmd BufNewFile,BufRead *.toml.tmpl set filetype=toml"
vim.cmd "autocmd BufNewFile,BufRead *.sh.tmpl set filetype=sh"

-- vim.cmd 'autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"'

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.api.nvim_create_augroup("bufcheck", { clear = true })
-- reload config file on change
autocmd("BufWritePost", {
  group = "bufcheck",
  pattern = vim.env.MYVIMRC,
  command = "silent source %",
})

-- sync clipboards because I'm easily confused
autocmd("TextYankPost", {
  group = "bufcheck",
  pattern = "*",
  callback = function()
    fn.setreg("+", fn.getreg "*")
  end,
})

-- start terminal in insert mode
autocmd("TermOpen", {
  group = "bufcheck",
  pattern = "*",
  command = "startinsert | set winfixheight",
})

-- start git messages in insert mode
autocmd("FileType", {
  group = "bufcheck",
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1",
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
