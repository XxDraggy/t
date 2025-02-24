local utils = require("ilzayn.utils.mode")

local hl_utils = { }

function hl_utils.remove_highlight_strings(string)
  return string:gsub(".%#[a-zA-Z_]+#", "")
end

function hl_utils.statusline_mode_highlight(separator)
  return table.concat({ "%#", utils.get_mode_highlight(separator), "#" })
end

function hl_utils.reset_highlight()
  return "%#Normal#"
end

function hl_utils.highlight_module(separators, content, is_active)
  local separator_highlight = is_active == false and
    "%#inactive_mode_reversed#" or
    hl_utils.statusline_mode_highlight(true)
  local content_highlight = is_active == false and
    "%#inactive_mode#" or
    hl_utils.statusline_mode_highlight()

  return table.concat({
    separator_highlight, separators.left,

    content_highlight, content,

    separator_highlight, separators.right,

    hl_utils.reset_highlight()
  })
end

function hl_utils.extend_highlight(name, highlight, write)
  local current = vim.api.nvim_get_hl(0, { name = name })
  local new = vim.tbl_extend('force', { }, current, highlight)

  if write == true then
    vim.api.nvim_set_hl(0, name, new)
  end

  return new
end

return hl_utils
