local utils = {}

function utils.width_less_than(target)
  return vim.opt.columns._value <= target
end
function utils.width_more_than(target)
  return vim.opt.columns._value > target
end

return vim.tbl_extend("error",
  { },
  utils,
  require("ilzayn.utils.mode"),
  require("ilzayn.utils.highlight"),
  require("ilzayn.utils.file")
)
