local ayu = {
  name = "ayu",

  colors = function()
    return {
      background = require("ilzayn.scheme.ayu").palette().bg,
      foreground = "#323843",
      emphasize = require("ilzayn.scheme.ayu").palette().keyword,
    }
  end,
  palette = function()
    local colors = require("ayu.colors")
    colors.generate(true)

    return colors
  end,

  lualine = function()
    local palette = require("ilzayn.scheme.ayu").palette()

    local lualine_ayu = {
      normal = {
        a = { fg = palette.bg, bg = palette.entity, gui = "bold" },
        b = { fg = palette.entity, bg = palette.panel_border },
        c = { fg = palette.fg, bg = palette.panel_border },
      },

      insert = {
        a = { fg = palette.bg, bg = palette.string, gui = "bold" },
        b = { fg = palette.string, bg = palette.panel_border },
      },

      visual = {
        a = { fg = palette.bg, bg = palette.accent, gui = "bold" },
        b = { fg = palette.accent, bg = palette.panel_border },
      },

      replace = {
        a = { fg = palette.bg, bg = palette.markup, gui = "bold" },
        b = { fg = palette.markup, bg = palette.panel_border },
      },

      command = {
        a = { fg = palette.bg, bg = palette.constant, gui = "bold" },
        b = { fg = palette.constant, bg = palette.panel_border },
      },

      terminal = {
        a = { fg = palette.bg, bg = palette.string, gui = "bold" },
        b = { fg = palette.string, bg = palette.panel_border },
      },

      inactive = {
        a = { fg = palette.fg, bg = palette.panel_border, gui = "bold" },
        b = { fg = palette.fg, bg = palette.panel_border },
        c = { fg = palette.fg, bg = palette.panel_border },
      },
    }

    return lualine_ayu
  end
}

return ayu

-- {                                                                                                                                                                                             accent = "#FFCC66",
--   bg = "#1F2430",
--   black = "#000000",
--   comment = "#6C7A8B",
--   constant = "#DFBFFF",
--   entity = "#73D0FF",
--   error = "#FF6666",
--   fg = "#CCCAC2",
--   fg_idle = "#707A8C",
--   func = "#FFD173",
--   generate = <function 1>,
--   guide_active = "#444A55",
--   guide_normal = "#323843",
--   gutter_active = "#757B84",
--   gutter_normal = "#4A505A",
--   keyword = "#FFAD66",
--   line = "#171B24",
--   lsp_inlay_hint = "#969696",
--   lsp_parameter = "#D3B8F9",
--   markup = "#F28779",
--   operator = "#F29E74",
--   panel_bg = "#1C212B",
--   panel_border = "#101521",
--   panel_shadow = "#161922",
--   regexp = "#95E6CB",
--   selection_bg = "#274364",
--   selection_border = "#232A4C",
--   selection_inactive = "#23344B",
--   special = "#FFDFB3",
--   string = "#D5FF80",
--   tag = "#5CCFE6",
--   ui = "#707A8C",
--   vcs_added = "#87D96C",
--   vcs_added_bg = "#313D37",
--   vcs_modified = "#80BFFF",
--   vcs_removed = "#F27983",
--   vcs_removed_bg = "#3E373A",
--   warning = "#FFA759",
--   white = "#FFFFFF"                                                                                                                                                                       
-- }
