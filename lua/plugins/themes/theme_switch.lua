return {
 "f-person/auto-dark-mode.nvim",
  opts = function()
    local fallback = "light"
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
    if handle ~= nil then
      local prefer = handle:read("*a")
      if string.find(prefer, "dark") then
        fallback = "dark"
      end
      handle:close()
    end
    return {
      set_dark_mode = function()
        vim.o.background = "dark"
      end,
      set_light_mode = function()
        vim.o.background = "light"
      end,
      fallback = fallback,
      update_interval = 3000,
    }
  end,
}
