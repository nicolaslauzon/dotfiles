-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine dracula theme
local lualine_dracula = require("lualine.themes.dracula")

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_dracula,
  },
})