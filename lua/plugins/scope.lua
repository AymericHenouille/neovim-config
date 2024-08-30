return {
  {
    "tiagovla/scope.nvim",
    opts = {},
    config = function()
      require("telescope").load_extension("scope")
    end
  }
}
