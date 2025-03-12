return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = function()
      local highlights = require("catppuccin.groups.integrations.bufferline")
      local palettes = require("catppuccin.palettes")
      local frappe = palettes.get_palette("frappe")
      return {
        diagnostics = "nvim_lsp",
        highlights = highlights.get({
          custom = {
            frappe = {
              fill = { bg = frappe.surface1 },
              indicator_selected = { sp = frappe.flamingo },
              buffer_selected = { sp = frappe.flamingo },
              TabLineSel = { bg = frappe.flamingo },
            },
          },
        }),
        options = {
          separator_style = "slant",
        },
      }
    end,
  },
}

