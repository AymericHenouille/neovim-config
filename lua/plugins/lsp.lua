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
      local lsp = require("config.lsp")
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      local signs = { Error = "", Warn = "", Hint = "󰧑", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      mason_lspconfig.setup({
        ensure_installed = lsp.lspservers,
        automatic_installation = true,
        handlers = lsp.lsphandlers(lspconfig)
      })
    end
  },
}
