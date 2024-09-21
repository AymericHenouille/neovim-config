local function map(keymap, keyset, description)
  local opts = { desc = description, silent = true }
  vim.keymap.set("n", keymap, keyset, opts)
end

map("<LEADER>ww", "<CMD>w<CR>", "Save the current file.")
map("<LEADER>wa", "<CMD>wa<CR>", "Save all opened files.")
map("<LEADER>q", "<CMD>qa<CR>", "Quit the current buffer.")
map("<LEADER>x", "<CMD>xa<CR>", "Save all opened files and quit neovim.")
