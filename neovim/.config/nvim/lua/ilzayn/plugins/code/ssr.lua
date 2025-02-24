return {
  "cshuaimin/ssr.nvim",

  opts = {
    border = "rounded",
    min_width = 70,
    min_height = 15,
    max_width = 120,
    max_height = 25,
    adjust_window = true,
    keymaps = {
      close = "q",
      next_match = "n",
      prev_match = "N",
      replace_confirm = "<cr>",
      replace_all = "<leader><cr>",
    },
  },

  keys = {
    {
      "<leader>r",
      function() require("ssr").open() end,
      mode = { "n", "x" },
      desc = "structural search and [r]eplace",
    }
  }
}
