return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({})
    local opts = { silent = true }
    local map = vim.keymap.set
    map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", opts)
    map("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<cr>", opts)
    map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<cr>", opts)
  end
}

