local map = require("features.map")
local nmap = map.nmap

---Create the opts used in map function.
---It add the noremap = true to the options.
---@param description string - The description.
---@return table opts The opts
local function create_opts(description)
  return {
    silent = true,
    desc = description,
    noremap = true,
  }
end

nmap("<TAB>",   "<CMD>BufferLineCycleNext<CR>",   create_opts("Navigate to the next buffer"))
nmap("<S-TAB>", "<CMD>BufferLineCyclePrev<CR>",   create_opts("Navigate to the previous buffer"))
nmap("<C-c>",   "<CMD>bd<CR>",                    create_opts("Close the current buffer"))
nmap("<C-S-C>", "<CMD>BufferLineCloseOthers<CR>", create_opts("Close all buffers expect the current one"))
