return {
  {
    "lewis6991/gitsigns.nvim",

    event = "BufReadPre",

    opts = {
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '┃' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '┃' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
    },
  },

  {
    "NeogitOrg/neogit",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },

    cmd = "Neogit",

    opts = {
      disable_hint = true,
      disable_line_numbers = false,
      disable_relative_line_numbers = false,
      integrations = {
        telescope = true,
        diffview = true,
      },
    },

    keys = {
      { "<leader>g", vim.cmd.Neogit, { desc = "open [g]it" } },
    }
  },
}
