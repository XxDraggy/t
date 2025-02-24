return {
  "stevearc/oil.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end,
    },
    win_options = {
      wrap = true,
      winblend = 0,
    },
    keymaps = {
      ["<C-c>"] = false,
      ["q"] = "actions.close",
    },
    float = {
      padding = 0,
      override = function(conf)
        local top_padding = 3
        local bottom_padding = 4
        local left_padding = 10
        local right_padding = 10

        conf.col = left_padding
        conf.width = conf.width - left_padding - right_padding
        conf.row = top_padding
        conf.height = conf.height - top_padding - bottom_padding

        return conf
      end
    }
  },

  keys = {
    { "<leader>e", function() vim.cmd.Oil("--float") end, desc = "open oil" }
  },

  cmd = "Oil"
}
