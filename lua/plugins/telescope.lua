return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" }
    },
    config = function()
      local builtin = require("telescope.builtin")
      local opts = {}
      local map = vim.keymap.set
      map("n", "<leader>ff", builtin.find_files, opts)
      map("n", "<leader>fg", builtin.live_grep, opts)
      map("n", "<leader>fb", builtin.buffers, opts)
      map("n", "<leader>fh", builtin.help_tags, opts)
      map("n", "<leader>fq", builtin.quickfix, opts)
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      })
      telescope.load_extension("ui-select")
    end
  }
}
