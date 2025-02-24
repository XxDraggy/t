return {
  "folke/trouble.nvim",

  opts = {},

  cmd = "Trouble",

  keys = {
    {
      "<leader>d",
      function() require("trouble").toggle({ mode = "diagnostics", focus = true }) end,
      desc = "open trouble [d]iagnostics",
    },
    {
      "[t",
      function() require("trouble").next({ mode = "diagnostics", skip_groups = true, jump = true }) end,
      desc = "jump to next [t]rouble diagnostic",
    },
    {
      "]t",
      function() require("trouble").prev({ mode = "diagnostics", skip_groups = true, jump = true }) end,
      desc = "jump to previous [t]rouble diagnostic",
    }
  },
}
