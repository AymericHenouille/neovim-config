print("nippet")

return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufEnter" },
  opts = {
    auto_attach = true,
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    current_line_blame = true,
    on_attach = function(buf)
      local gitsigns = require("gitsigns")
      local nmap = require("features.map").nmap
      nmap("]c", function()
        if not vim.wo.diff then
          gitsigns.nav_hunk("next")
        end
      end, "Navigate to the next git hunk")

      nmap("[c", function()
        if not vim.wo.diff then
          gitsigns.nav_hunk("prev")
        end
      end, "Navigate to the previous git hunk")
    end
  },
  config = function(_, opts)
    local gitsigns = require("gitsigns")
    gitsigns.setup(opts)
  end,
}

