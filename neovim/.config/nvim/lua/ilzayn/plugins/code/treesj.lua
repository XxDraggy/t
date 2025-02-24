return {
  "Wansmer/treesj",

  keys = {
    { "<space>y", function() require("treesj").toggle() end, desc = "toggle [t]reesj" },
  },

  dependencies = { "nvim-treesitter/nvim-treesitter" },

  opts = {
    use_default_keymaps = false,
    max_join_length = 500,
  }
}
