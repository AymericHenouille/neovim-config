return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local highlights = require("catppuccin.groups.integrations.bufferline")
    local palettes = require("catppuccin.palettes")
    local frappe = palettes.get_palette("frappe")
    return {
      highlights = highlights.get({
        custom = {
          frappe = {
            fill = { bg = frappe.surface1 }
          },
        },
      }),
      options = {
        separator_style = "slant",
      },
    }
  end,
}

