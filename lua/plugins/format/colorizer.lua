return {
  "norcalli/nvim-colorizer.lua",
  opts = {
    RGB      = true,
    RRGGBB   = true,
    names    = true,
    RRGGBBAA = true,
    rgb_fn   = true,
    hsl_fn   = true,
    css      = true,
    css_fn   = true,
    mode     = "foreground",
  },
  config = function(_, opts)
    local colorizer = require("colorizer")
    colorizer.setup({ "*" }, opts)
  end,
}
