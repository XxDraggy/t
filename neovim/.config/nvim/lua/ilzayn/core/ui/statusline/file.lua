local utils = require("ilzayn.utils")

return function()
  local icon = utils.get_file_icon()
  local icon_defined = icon ~= ""

  local name = utils.get_file_name()

  local flags = utils.get_file_flags()
  if vim.bo.buftype ~= "" and vim.bo.buftype ~= "acwrite" then
    flags = ""
  end
  local flags_defined = flags ~= ""

  local type = utils.get_file_type()
  local type_defined = type ~= ""

  local content = table.concat({
    (utils.width_more_than(35) and icon_defined)
      and icon .. "  "
      or "",

    name,

    (utils.width_more_than(50) and flags_defined)
      and " " .. flags
      or "",

    (utils.width_more_than(70) and type_defined)
      and "  |  " .. type
      or "",
  })

  return content
end
