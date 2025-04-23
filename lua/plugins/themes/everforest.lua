return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
  opts = {
    background = "soft",
    show_eob = false,
  },
  config = function(_, opts)
    vim.opt.termguicolors = true
    local everforest = require("everforest")
    everforest.setup(opts)
    vim.cmd(":colorscheme everforest")
  end,
}
