return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local which_key = require("which-key");
    which_key.setup({})

    local nmap = require("utils.map").nmap
    nmap("<LEADER>?", function()
      which_key.show({ global = false })
    end, "Buffer local keymaps (which_key)")
  end
}
