require("ilzayn.core.options")
require("ilzayn.core.keymaps")
require("ilzayn.core.autocommands")
require("ilzayn.core.ui")

_print = print
print = function(...)
  vim.notify(table.concat({ ... }, " "))
end
