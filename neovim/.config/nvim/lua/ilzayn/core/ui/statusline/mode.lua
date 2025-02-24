local utils = require("ilzayn.utils")

return function(separators)
  local mode = utils.get_mode_name()
  local content = table.concat({ " ", mode, " " })

  return utils.highlight_module(separators, content)
end
