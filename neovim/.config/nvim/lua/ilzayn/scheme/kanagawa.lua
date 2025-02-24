local kanagawa = {
  name = "kanagawa",

  palette = function()
    local kanagawa = require("kanagawa.colors").setup({ theme = "wave" }).theme

    return kanagawa
  end,

  lualine = function()
    local palette = require("ilzayn.scheme.kanagawa").palette()

    local lualine_kanagawa = {
      normal = {
        a = { bg = palette.syn.fun, fg = palette.ui.bg_m3, gui = "bold" },
        b = { bg = palette.diff.change, fg = palette.syn.fun },
        c = { bg = palette.ui.bg_p1, fg = palette.ui.fg },
      },

      insert = {
        a = { bg = palette.diag.ok, fg = palette.ui.bg, gui = "bold" },
        b = { bg = palette.ui.bg, fg = palette.diag.ok },
      },

      visual = {
        a = { bg = palette.syn.keyword, fg = palette.ui.bg, gui = "bold" },
        b = { bg = palette.ui.bg, fg = palette.syn.keyword },
      },

      replace = {
        a = { bg = palette.syn.constant, fg = palette.ui.bg, gui = "bold" },
        b = { bg = palette.ui.bg, fg = palette.syn.constant },
      },

      command = {
        a = { bg = palette.syn.operator, fg = palette.ui.bg, gui = "bold"},
        b = { bg = palette.ui.bg, fg = palette.syn.operator },
      },

      terminal = {
        a = { bg = "#ffffff", fg = "#000000" }
      },

      inactive = {
        a = { bg = palette.ui.bg_m3, fg = palette.ui.fg_dim, gui = "bold" },
        b = { bg = palette.ui.bg_m3, fg = palette.ui.fg_dim, gui = "bold" },
        c = { bg = palette.ui.bg_m3, fg = palette.ui.fg_dim },
      }
    }

    return lualine_kanagawa
  end
}

kanagawa.background = kanagawa.palette().ui.bg
kanagawa.foreground = "#44445a"
kanagawa.emphasize = kanagawa.palette().syn.keyword

return kanagawa

-- {
--   diag = {
--     error = "#E82424",
--     hint = "#6A9589",
--     info = "#658594",
--     ok = "#98BB6C",
--     warning = "#FF9E3B"                                                                                                                                                                       },
--   diff = {                                                                                                                                                                                      add = "#2B3328",
--     change = "#252535",
--     delete = "#43242B",
--     text = "#49443C"                                                                                                                                                                          },
--   syn = {                                                                                                                                                                                       comment = "#727169",
--     constant = "#FFA066",
--     deprecated = "#717C7C",
--     fun = "#7E9CD8",
--     identifier = "#E6C384",
--     keyword = "#957FB8",
--     number = "#D27E99",
--     operator = "#C0A36E",
--     parameter = "#b8b4d0",
--     preproc = "#E46876",
--     punct = "#9CABCA",
--     regex = "#C0A36E",
--     special1 = "#7FB4CA",
--     special2 = "#E46876",
--     special3 = "#FF5D62",
--     statement = "#957FB8",
--     string = "#98BB6C",
--     type = "#7AA89F",
--     variable = "none"                                                                                                                                                                         },
--   term = { "#16161D",
--     "#C34043",
--     "#76946A",
--     "#C0A36E",
--     "#7E9CD8",
--     "#957FB8",
--     "#6A9589",
--     "#C8C093",
--     "#727169",
--     "#E82424",
--     "#98BB6C",
--     "#E6C384",
--     "#7FB4CA",
--     "#938AA9",
--     "#7AA89F",
--     "#DCD7BA",
--     "#FFA066",
--     "#FF5D62" },
--   ui = {
--     bg = "#1F1F28",
--     bg_dim = "#181820",
--     bg_gutter = "#2A2A37",
--     bg_m1 = "#1a1a22",
--     bg_m2 = "#181820",
--     bg_m3 = "#16161D",
--     bg_p1 = "#2A2A37",
--     bg_p2 = "#363646",
--     bg_search = "#2D4F67",
--     bg_visual = "#223249",
--     fg = "#DCD7BA",
--     fg_dim = "#C8C093",
--     fg_reverse = "#223249",
--     float = {                                                                                                                                                                                     bg = "#16161D",
--       bg_border = "#16161D",
--       fg = "#C8C093",
--       fg_border = "#54546D"                                                                                                                                                                     },
--     nontext = "#54546D",
--     pmenu = {                                                                                                                                                                                     bg = "#223249",
--       bg_sbar = "#223249",
--       bg_sel = "#2D4F67",
--       bg_thumb = "#2D4F67",
--       fg = "#DCD7BA",
--       fg_sel = "none"                                                                                                                                                                           },
--     special = "#938AA9",
--     whitespace = "#54546D"                                                                                                                                                                    },
--   vcs = {                                                                                                                                                                                       added = "#76946A",
--     changed = "#DCA561",
--     removed = "#C34043"                                                                                                                                                                     
--   }                                                                                                                                                                                       
-- }
