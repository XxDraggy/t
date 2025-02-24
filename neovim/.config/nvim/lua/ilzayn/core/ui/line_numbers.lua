local utils = require("ilzayn.utils")

vim.api.nvim_create_autocmd({ "VimEnter", "ModeChanged" }, {
  group = vim.api.nvim_create_augroup("ilzayn_line_number", { }),
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLineNr",
      { link = utils.get_mode_highlight(true) }
    )
  end
})
