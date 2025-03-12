local nmap = require("features.map").nmap
nmap("<LEADER>ff", "<CMD>Telescope find_files<CR>", "Telescope find files")
nmap("<LEADER>fg", "<CMD>Telescope live_grep<CR>", "Telescope live grep")
nmap("<LEADER>fb", "<CMD>Telescope scope buffers<CR>", "Telescope buffers")
nmap("<LEADER>fq", "<CMD>Telescope quickfix<CR>", "Telescope open quickfix list")
nmap("<LEADER>fe", "<CMD>Telescope symbols<CR>", "Telescope open emoji")

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  command = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    { "tiagovla/scope.nvim", config = true }
  },
  opts = {
    defaults = {
      mappings = {
        ["i"] = {
          -- Utility action to open all selected files into buffers
          ["<CR>"] = function(bufnr)
            local actions = require("telescope.actions")
            local actions_state = require("telescope.actions.state")
            local single_selection = actions_state.get_selected_entry()
            local multi_selection = actions_state.get_current_picker(bufnr):get_multi_selection()
            if not vim.tbl_isempty(multi_selection) then
              actions.close(bufnr)
              for _, file in pairs(multi_selection) do
                if file.path ~= nil then
                  vim.cmd(string.format("edit %s", file.path))
                end
              end
              vim.cmd(string.format("edit %s", single_selection.path))
            else
              actions.select_default(bufnr)
            end
          end,
        },
      },
    },
  },
  config = function(_, opts)
    local mergetables = require("features.table").mergetables
    local telescope = require("telescope")
    telescope.setup(mergetables({opts, {
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
        ["media_files"] = { },
      },
    }}))
    telescope.load_extension("ui-select")
    telescope.load_extension("media_files")
    telescope.load_extension("scope")
  end,
}
