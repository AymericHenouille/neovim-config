local concattable = require("utils.concattable")

local lspservers = {
  "angularls",
  "cssls",
  "html",
  "lua_ls",
  "ts_ls",
  "jdtls"
}

local function lsphandlers(lspconfig)
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local on_attach = require("mapping.lsp")
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  return {
    function(servername)
      lspconfig[servername].setup(opts)
    end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            },
          }
        }
      })
    end
  }
end

return {
  lspservers = concattable({ lspservers }),
  lsphandlers = lsphandlers
}
