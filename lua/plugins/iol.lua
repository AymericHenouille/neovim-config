return {
  "stevearc/oil.nvim",
  dependencies = {
    { "echasnovski/mini.icons", opts = {} }
  },
  config = function()
    local iol = require("oil")
    iol.setup({})

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
      desc = "Open parent directory",
      silent = true
    })
  end
}
