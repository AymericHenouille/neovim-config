return {
  "akinsho/toggleterm.nvim",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({})

    local map = vim.keymap.set
    map("n", "<leader>h", "<cmd>ToggleTerm<cr>")
    map("n", "<C-x>", "<C-\\><C-n>")
  end
}
