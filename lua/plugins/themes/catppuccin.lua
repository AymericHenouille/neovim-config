return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "auto",
    background = {
        light = "latte",
        dark = "frappe",
    },
    transparent_background = true,
    show_end_of_buffer = false,
    term_colors = false,
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic" },
    },
    default_integrations = false,
    integrations = {
      gitsigns = true,
      blink_cmp = true,
      bufferline = false,
      mason = true,
      telescope = true,
      treesitter = true,
    },
  },
  config = function(_, opts)
    vim.opt.termguicolors = true
    local catppuccin = require("catppuccin")
    catppuccin.setup(opts)
    vim.cmd(":colorscheme catppuccin")
  end,
} 
