local utils = require("ilzayn.utils")
local M = { }

function M.get_line_progress()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")

  if current_line == 1 then
    return "Top"
  elseif current_line == total_lines then
    return "Bottom"
  else
    return string.format("%d%%%%", math.floor(current_line / total_lines * 100))
  end
end

function M.get_line_location()
  return "%l:%c"
end

return function(separators)
  local progress = M.get_line_progress()
  local location = M.get_line_location()

  local content = table.concat({
    utils.width_more_than(50)
      and "  "
      or " ",

    utils.width_more_than(70) and
      progress .. "  |  "
    or "",

    location,

    utils.width_more_than(50)
      and "  "
      or " ",
  })

  return utils.highlight_module(separators, content)
end

