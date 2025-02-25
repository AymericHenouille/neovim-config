return {
  "williamboman/mason-lspconfig.nvim",
  name = "mason-lspconfig",
  dependencies = {
    { "neovim/nvim-lspconfig", name = "nvim-lspconfig" },
    require("plugins.lsp.mason")
  },
  config = function()
    local masonlspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local support = require("configs.support")
    masonlspconfig.setup({
      ensure_installed = support.lspservers,
      automatic_installation = true,
      handlers = support.handlers(lspconfig, {}),
    })
  end,
}
