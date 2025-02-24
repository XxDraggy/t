return {
  -- cond = false,
  "kevinhwang91/nvim-ufo",

  dependencies = { "kevinhwang91/promise-async" },

  lazy = false,
  -- event = "VeryLazy",

  opts = {
    provider_selector = function(_, _, _)
      return { "lsp", "indent" }
    end,
  },

  keys = {
    {
      "zR",
      function() require("ufo").openAllFolds() end,
      desc = "open all folds",
    },
    {
      "zM",
      function() require("ufo").closeAllFolds() end,
      desc = "close all folds",
    },
  },

  init = function()
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end
}
