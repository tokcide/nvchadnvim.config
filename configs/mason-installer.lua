vim.api.nvim_create_autocmd("User", {
  pattern = "MasonToolsStartingInstall",
  callback = function()
    vim.schedule(function()
      print "mason-tool-installer is starting"
    end)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MasonToolsUpdateCompleted",
  callback = function(e)
    vim.schedule(function()
      print(vim.inspect(e.data)) -- print the table that lists the programs that were installed
    end)
  end,
})

return {
  ensure_installed = {
    "prettier",
    "stylua",
    "shfmt",
    "isort",
    "black",
    "pylint",
    "eslint_d",
  },
  auto_update = true,
}
