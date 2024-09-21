return {
	"romgrk/barbar.nvim",
  lazy = false,
	dependencies = {
    "lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons"
	},
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    local barbar = require("barbar")
    barbar.setup({})

    local function dsc(description)
      local mergetable = require("utils.mergetable")
      local barbar_opts = { silent = true }
      return mergetable({ barbar_opts, { desc = description } })
    end

    local map = vim.keymap.set

    map("n", "<s-tab>", "<cmd>BufferPrevious<cr>", dsc("Go to the previous tab"))
    map("n", "<tab>", "<cmd>BufferNext<cr>", dsc("Go to the next tab"))
    for i=1,10 do
      map("n", "<leader>" .. (i % 10), "<cmd>BufferGoto " .. i .. "<cr>", dsc("Go to the tab " .. i))
    end
    map("n", "<c-,>", "<cmd>BufferMovePrevious<cr>", dsc("Move tab to left"))
    map("n", "<c-.>", "<cmd>BufferMoveNext<cr>", dsc("Move tab to right"))
    map("n", "<c-<>", "<cmd>BufferScrollLeft<cr>", dsc("Scroll tab to left"))
    map("n", "<c->>", "<cmd>BufferScrollRight<cr>", dsc("Scroll tab to right"))
    map("n", "<leader>bc", "<cmd>BufferClose<cr>", dsc("Close the current tab"))
    map("n", "<leader>bhc", "<cmd>BufferCloseBuffersLeft<cr>", dsc("Close the left tabs"))
    map("n", "<leader>blc", "<cmd>BufferCloseBuffersRight<cr>", dsc("Close the right tabs"))
    map("n", "<leader>bp", "<cmd>BufferPin<cr>", dsc("Pin/Unpin the current tab"))
    map("n", "<leader>bbc", "<cmd>BufferCloseAllButCurrent<cr>", dsc(""))
    map("n", "<leader>bbpc", "<cmd>BufferCloseAllButPinned<cr>", dsc(""))
  end
}
