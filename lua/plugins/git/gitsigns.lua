return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufEnter" },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    auto_attach = true,
    on_attach = function(buf)
      local gitsigns = require("gitsigns")
      local nmap = require("features.map").nmap

      nmap("]c", function()
        gitsigns.nav_hunk("next")
      end, "Navigate to the next git hunk")

      nmap("[c", function()
        gitsigns.nav_hunk("previous")
      end, "Navigate to the previous git hunk")
    end
  },
  config = function(_, opts)
    local gitsigns = require("gitsigns")
    gitsigns.setup(opts)
  end,
}

