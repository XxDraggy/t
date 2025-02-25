return {
  "ggandor/leap.nvim",

  config = function()
    vim.api.nvim_set_hl(0, "LeapLabel", {
      fg = require("ilzayn.scheme").colors().background,
      bg = require("ilzayn.scheme").colors().emphasize,
    })
  end,

  keys = {
    {
      "s",
      "<Plug>(leap)",
      mode = {"n", "x", "o"},
      desc = "[s]earch",
    },
  }
}
