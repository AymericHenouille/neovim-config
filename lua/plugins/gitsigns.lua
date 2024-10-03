return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({})
    local nmap = require("utils.map").nmap
    nmap("<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", "Display the preview hunk.")
    nmap("<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle the git blame on the line.")
    nmap("<leader>gtd", "<cmd>Gitsigns toggle_deleted<cr>", "Toggle the deleted lines since the last commit.")
  end
}

