local utils = require("ilzayn.utils")

return function(separators)
  local mode = utils.get_mode_name()
  local short_mode = mode:sub(1, 1)
  local content = table.concat({
    " ",

    utils.width_more_than(50)
      and mode
      or short_mode,

    " ",
  })

  return utils.highlight_module(separators, content)
end
