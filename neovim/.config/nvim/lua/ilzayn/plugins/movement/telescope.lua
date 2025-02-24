return {
  {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",

      "nvim-tree/nvim-web-devicons",
    },

    cmd = "Telescope",

    keys = {
      {
        "<leader>sf",
        function() require("telescope.builtin").find_files() end,
        desc = "[s]earch [f]ile",
      },
      {
        "<leader>ss",
        function() require("telescope.builtin").live_grep() end,
        desc = "[s]earch [s]tring",
      },
      {
        "<leader>sg",
        function() require("telescope.builtin").git_files() end,
        desc = "[s]earch [g]it file",
      },
      {
        "<leader>sc",
        function() require("telescope.builtin").grep_string() end,
        desc = "[s]earch word under [c]ursor",
      },
      {
        "<leader>sb",
        function() require("telescope.builtin").buffers() end,
        desc = "[s]earch [b]uffer",
      },
      {
        "<leader>sr",
        function() require("telescope.builtin").resume() end,
        desc = "[s]earch [r]esume files",
      },
    },

    opts = {
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = function(opts)
              require("telescope.actions").move_selection_previous(opts)
            end,
            ["<C-j>"] = function(opts)
              require("telescope.actions").move_selection_next(opts)
            end,
            ["<C-q>"] = function(opts)
              require("telescope.actions").send_selected_to_qflist(opts)
              require("telescope.actions").open_qflist(opts)
            end,
          }
        }
      }
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",

    lazy = true,

    build = "make",
    -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",

    config = function()
      require("telescope").load_extension("fzf")
    end
  },
}
