---@alias VimMode
---| '"n"' # Normal mode.
---| '"v"' # Visual mode.
---| '"i"' # Insert mode.
---| '"t"' # terminal mode.

---Create a keymap for vim.
---@param mode (VimMode | VimMode[]) The target vim mode.
---@param keymap (string) The keymap that trigger the action.
---@param action (string | function) The action to perform. It can be a command or a function.
---@param options ((string | table)?) The optional description or the options.
local function map(mode, keymap, action, options)
  local opts = {}
  local description = ""

  if options ~= nil then
    local t = type(options)
    if t == "string" then
      description = options
    elseif t == "table" then
      opts = options
    end
  end

  if opts == {} then
    opts = { silent = true, desc = description }
  end

  local keyset = vim.keymap.set
  keyset(mode, keymap, action, opts)
end

---Create a keymap for vim in normal mode.
---@param keymap (string) The keymap that trigger the action.
---@param action (string | function) The action to perform. It can be a command or a function.
---@param options ((string | table)?) The optional description or the options.
local function nmap(keymap, action, options)
  map("n", keymap, action, options)
end

---Create a keymap for vim in visual mode.
---@param keymap (string) The keymap that trigger the action.
---@param action (string | function) The action to perform. It can be a command or a function.
---@param options ((string | table)?) The optional description or the options.
local function vmap(keymap, action, options)
  map("v", keymap, action, options)
end

---Create a keymap for vim in insert mode.
---@param keymap (string) The keymap that trigger the action.
---@param action (string | function) The action to perform. It can be a command or a function.
---@param options ((string | table)?) The optional description or the options.
local function imap(keymap, action, options)
  map("i", keymap, action, options)
end

---Create a keymap for vim in terinal mode.
---@param keymap (string) The keymap that trigger the action.
---@param action (string | function) The action to perform. It can be a command or a function.
---@param options ((string | table)?) The optional description or the options.
local function tmap(keymap, action, options)
  map("t", keymap, action, options)
end

return {
  map = map,
  nmap = nmap,
  vmap = vmap,
  imap = imap,
  tmap = tmap
}
