local lsp = require("config.lsp")

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
      },
      { "hrsh7th/cmp-nvim-lsp" }
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = lsp.lspservers,
        automatic_installation = true,
        handlers = lsp.lsphandlers(lspconfig)
      })
    end
  },
}
