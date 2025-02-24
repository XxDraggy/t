local utils = require("ilzayn.utils")

local M = {
  separators = { left = "", right = "" },

  mode_module = require("ilzayn.core.ui.statusline.mode"),
  file_module = require("ilzayn.core.ui.statusline.file"),
  line_module = require("ilzayn.core.ui.statusline.line"),
}

local function get_spacing(left_component, center_component)
  left_component = utils.remove_highlight_strings(left_component)
  center_component = utils.remove_highlight_strings(center_component)

  local window_width = vim.opt.columns._value
  local window_center = math.floor(window_width / 2)

  local component_width = vim.api.nvim_strwidth(center_component)
  local component_center = math.floor(component_width / 2)

  local left_width = vim.api.nvim_strwidth(left_component) + 2 -- left margin
  local space_amount = window_center - component_center - left_width

  return string.rep(" ", space_amount)
end

function M.statusline()
  local mode = M.mode_module(M.separators)
  local file = M.file_module()
  local line = M.line_module(M.separators)

  local space = get_spacing(mode, file)

  return table.concat({
    mode,
    space,
    file,
    "%=",
    line,
  })
end

Statusline = M.statusline

vim.opt.statusline = "%!v:lua.Statusline()"

return M
