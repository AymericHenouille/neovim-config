local hasfloatingwin = require("utils.hasfloatingwin")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("showDiagnostics", { clear = true })
autocmd("CursorHold", {
  group = "showDiagnostics",
  pattern = { "*" },
  callback = function()
    if vim.diagnostic.is_enabled() then
      if not hasfloatingwin() then
        vim.diagnostic.open_float()
      end
    end
  end
})
