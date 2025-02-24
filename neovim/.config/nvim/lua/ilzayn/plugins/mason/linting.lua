return {
  "rshkarin/mason-nvim-lint",

  event = "BufReadPre",

  dependencies = {
    {
      "mfussenegger/nvim-lint",

      event = { "BufReadPre" },

      config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd(
          { "BufEnter", "BufWritePost", "InsertLeave" },
          {
            group = lint_augroup,
            callback = function() lint.try_lint() end,
          }
        )
      end,
    },
  },

  opts = {},
}
