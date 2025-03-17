local mapper = require("features.map")
local map = mapper.map
local nmap = mapper.nmap

nmap("<LEADER>tt", "<CMD>ToggleTerm direction=tab<CR>", "Open a terminal in a tab.")
nmap("<LEADER>th", "<CMD>ToggleTerm direction=horizontal<CR>", "Open a terminal in an horizontal window.")
nmap("<LEADER>tv", "<CMD>ToggleTerm direction=vertical<CR>", "Open a terminal in a vertial window.")
nmap("<LEADER>tf", "<CMD>ToggleTerm direction=float<CR>", "Open a terminal in a floating window.")

map("t", "<C-x>", "<C-\\><C-n>", "Leave the terminal focus.")
map("t", "<C-c>", "exit<CR>", "Close the terminal.")
