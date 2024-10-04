return function(_, buffer)
  ---Create the options for the mapkey function with the right buffer.
  ---@param description (string) The description.
  ---@return table The options table.
  local function opts(description)
    return { buffer = buffer, desc = description, silent = true }
  end

  local nmap = require("utils.map").nmap
  nmap("<leader>gR", "<cmd>Telescope lsp_references<CR>", opts("Show LSP references"))
  nmap("<leader>gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  nmap("<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts("Show LSP definitions"))
  nmap("<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts("Show LSP implementations"))
  nmap("<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts("Show LSP type definitions"))
  nmap("<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))
  nmap("<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))
  nmap("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Show buffer diagnostics"))
  nmap("[d", vim.diagnostic.goto_prev, opts("Go to previous diagnostic"))
  nmap("]d", vim.diagnostic.goto_next, opts("Go to next diagnostic"))
  nmap("K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor"))
  nmap("<leader>rs", ":LspRestart<CR>", opts("Restart LSP"))
end
