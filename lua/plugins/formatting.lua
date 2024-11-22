local lint_command = require("commands.lintcommand")
return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "rshkarin/mason-nvim-lint",
    opts = {
      ensure_installed = { "eslint_d" },
      automatic_installation = false,
    },
  },
  config = function()
    local nvim_lint = require("lint")
    local nodejs_formatter = { "eslint_d" }
    nvim_lint.linters_by_ft = {
      javascript = nodejs_formatter,
      typescript = nodejs_formatter,
      javascriptreact = nodejs_formatter,
      typescriptreact = nodejs_formatter,
    }
    lint_command(nvim_lint)
  end
}
