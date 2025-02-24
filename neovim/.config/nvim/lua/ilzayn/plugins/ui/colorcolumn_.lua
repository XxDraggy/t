return {
  "lukas-reineke/virt-column.nvim",

  event = "BufReadPre",

  opts = {
    char = "┃",
    highlight = "ColorColumn",
  },

  config = function(_, opts)
    require("virt-column").setup(opts)

    vim.api.nvim_set_hl(
      0,
      "ColorColumn",
      { link = "inactive_mode_reversed" }
    )
  end
}
