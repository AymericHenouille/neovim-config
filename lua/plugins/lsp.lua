local utils = require("utils")
local servers = require("config.lspservers")

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
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
          ensure_installed = utils.merge_tables(servers, {

          })
        }
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      for _, value in pairs(servers) do
        lspconfig[value].setup({
          capabilities = capabilities
        })
      end
      local map = vim.keymap.set
      map("n", "<leader>k", vim.lsp.buf.hover, {})
      map("n", "<leader>gd", vim.lsp.buf.definition, {})
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
