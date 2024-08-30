return {
  "goolord/alpha-nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" }
  },
  config = function()
    local alpha = require("alpha")
    local theme = require("alpha.themes.startify")
    theme.file_icons.provider = "devicons"
    alpha.setup(theme.config)
  end
}
