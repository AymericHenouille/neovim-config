return {
  treesitters = { "lua", "luadoc" },
  lspservers = { "lua_ls" },
  handlers = {
    ["lua_ls"] = function(lspconfig, opts)
      vim.notify("build lua")
      local table = require("features.table")
      return function()
        vim.notify("setup lua")
        lspconfig.lua_ls.setup(table.mergetables({
          opts,
          {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          },
        }))
      end
    end,
  },
}
