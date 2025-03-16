return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = function()
      return {
        options = {
          separator_style = "slant",
        },
      }
    end,
  },
}

