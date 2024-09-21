return function(_, buffer)
  local function nmap(keybind, callback, description)
    local opts = { buffer = buffer, desc = description, silent = true }
    local map = vim.keymap.set
    map("n", keybind, callback, opts)
  end

  nmap("<leader>gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
  nmap("<leader>gD", vim.lsp.buf.declaration, "Go to declaration")
  nmap("<leader>gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
  nmap("<leader>gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
  nmap("<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
  nmap("<leader>ca", vim.lsp.buf.code_action, "See available code actions")
  nmap("<leader>rn", vim.lsp.buf.rename, "Smart rename")
  nmap("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
  nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
  nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
  nmap("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
  nmap("<leader>rs", ":LspRestart<CR>", "Restart LSP")
end
