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
    icon,
    icon_defined and "  " or "",

    name,

    flags_defined and " " or "",
    flags,

    type_defined and "  |  " or "",
    type,
  })

  return content
end
