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
  end
}

