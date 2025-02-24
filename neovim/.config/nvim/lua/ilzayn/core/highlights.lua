local utils = require("ilzayn.utils")
local highlight = vim.api.nvim_set_hl
local lualine_theme = require("ilzayn.scheme").lualine()
local colors = require("ilzayn.scheme").colors()

for mode, sections in pairs(lualine_theme) do
  vim.api.nvim_set_hl(0, mode .. "_mode", {
    fg = colors.background,
    bg = sections.a.bg,
  })
  vim.api.nvim_set_hl(0, mode .. "_mode_reversed", {
    fg = sections.a.bg,
    bg = "NONE",
  })
end

-- invisible cursorline
highlight(0, "CursorLine", { })
