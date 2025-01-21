return {
  "stevearc/oil.nvim",
  dependencies = {
    { "echasnovski/mini.icons", opts = {} }
  },
  config = function()
    local iol = require("oil")
    iol.setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true
    })
    local nmap = require("utils.map").nmap
    nmap("-", function()
      local hasfloatingwin = require("utils.hasfloatingwin")
      if not hasfloatingwin() then
        vim.cmd("Oil --float")
      end
    end, "Open parent directory")
  end
}
