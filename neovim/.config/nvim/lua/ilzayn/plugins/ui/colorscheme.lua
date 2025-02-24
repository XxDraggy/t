-- Other themes
--
-- sainnhe/everforst dark-hard
-- Shatur/neovim-ayu
-- catpuccin/nvim macchiato
-- rebelot/kanagawa.nvim
--
-- folke/tokyonight moon
-- decays/decay.nvim
-- oxfist/night-owl.nvim
-- rose-pine/neovim
-- olivercederborg/poimandres.nvim
-- sainnhe/gruvbox-material

return {
  {
    "AlexvZyl/nordic.nvim",

    lazy = false,

    priority = 1000,

    opts = {
      on_palette = function(palette) end,
      after_palette = function(palette) end,
      on_highlight = function(highlights, palette) end,
      bold_keywords = false,
      italic_comments = true,
      transparent = {
        bg = true,
        float = true,
      },
      bright_border = true,
      reduced_blue = true,
      swap_backgrounds = false,
      cursorline = {
        bold = false,
        bold_number = false,
        theme = 'dark',
        blend = 0,
      },
      noice = {
        style = 'classic',
      },
      telescope = {
        style = 'classic',
      },
      leap = {
        dim_backdrop = false,
      },
      ts_context = {
        dark_background = false,
      }
    },

    config = function(_, opts)
      local nordic = require("nordic")

      nordic.load(opts)

      require("ilzayn.core.highlights")
    end
  },
}
