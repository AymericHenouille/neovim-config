return {
  {
    "tiagovla/scope.nvim",
    config = function()
      local scope = require("scope")
      scope.setup({
        hooks = {
          pre_tab_leave = function()
            vim.api.nvim_exec_autocmds('User', {pattern = 'ScopeTabLeavePre'})
          end,

          post_tab_enter = function()
            vim.api.nvim_exec_autocmds('User', {pattern = 'ScopeTabEnterPost'})
          end,
        },
      })
      require("telescope").load_extension("scope")
    end
  }
}
