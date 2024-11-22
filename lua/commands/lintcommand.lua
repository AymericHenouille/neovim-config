--- Build the command to trigger the lint.
--- @param lint any the nvim-lint plugin instance.
return function(lint)
  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    pattern = { "*.js", "*.ts" },
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end
  })
end
