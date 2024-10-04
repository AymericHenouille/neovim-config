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
    local map = require("utils.map").nmap
    map("<s-tab>", "<cmd>BufferPrevious<cr>", "Go to the previous tab")
    map("<tab>", "<cmd>BufferNext<cr>", "Go to the next tab")
    for i=1,10 do
      map("<leader>" .. (i % 10), "<cmd>BufferGoto " .. i .. "<cr>", "Go to the tab " .. i)
    end
    map("<c-,>", "<cmd>BufferMovePrevious<cr>", "Move tab to left")
    map("<c-.>", "<cmd>BufferMoveNext<cr>", "Move tab to right")
    map("<c-<>", "<cmd>BufferScrollLeft<cr>", "Scroll tab to left")
    map("<c->>", "<cmd>BufferScrollRight<cr>", "Scroll tab to right")
    map("<leader>bc", "<cmd>BufferClose<cr>", "Close the current tab")
    map("<leader>bhc", "<cmd>BufferCloseBuffersLeft<cr>", "Close the left tabs")
    map("<leader>blc", "<cmd>BufferCloseBuffersRight<cr>", "Close the right tabs")
    map("<leader>bp", "<cmd>BufferPin<cr>", "Pin/Unpin the current tab")
    map("<leader>bbc", "<cmd>BufferCloseAllButCurrent<cr>", "Close all buffers but the current one.")
    map("<leader>bbpc", "<cmd>BufferCloseAllButPinned<cr>", "Close all buffers but the pinneds")
  end
}
