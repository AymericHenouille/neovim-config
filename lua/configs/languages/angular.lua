return {
  treesitters = { "html", "css", "scss", "javascript", "typescript", "angular" },
  lspservers = { "html", "cssls", "ts_ls", "angularls", "emmet_ls" },
  handlers = {
    ["ts_ls"] = function(lspconfig, opts)
      local table = require("features.table")
      return function()
        lspconfig.ts_ls.setup(table.mergetables({opts, {
          settings = {
            quoteStyle = "single",
          },
        }}))
      end
    end
  },
}


