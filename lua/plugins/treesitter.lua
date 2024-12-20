return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      ensure_installed = {
        "angular",
        "jsdoc",
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    })
  end
}
