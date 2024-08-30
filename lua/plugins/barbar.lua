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
  opts = {
    sidebar_filetypes = {
      ["neo-tree"] = true
    }
  },
}
