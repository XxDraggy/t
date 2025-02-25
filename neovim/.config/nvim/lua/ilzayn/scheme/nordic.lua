local nordic = {
  name = "nordic",

  colors = function()
    return {
      background = require("ilzayn.scheme.nordic").palette().gray0,
      foreground = require("ilzayn.scheme.nordic").palette().gray2,
      emphasize = require("ilzayn.scheme.nordic").palette().orange.base,
    }
  end,

  palette = function()
    local colors = require("nordic.colors")

    return colors
  end,

  lualine = function()
    local palette = require("ilzayn.scheme.nordic").palette()

    local lualine_nordic = {
      normal = {
        a = { bg = palette.green.bright, fg = palette.black0, gui = 'bold' },
        b = { bg = palette.gray1, fg = palette.white1 },
        c = { bg = palette.bg_statusline, fg = palette.white0 },
      },
      insert = {
        a = { bg = palette.blue1, fg = palette.black0, gui = 'bold' },
        b = { bg = palette.gray1, fg = palette.white1 },
        c = { bg = palette.bg_statusline, fg = palette.white0 },
      },
      command = {
        a = { bg = palette.cyan.bright, fg = palette.black0, gui = 'bold' },
        b = { bg = palette.gray1, fg = palette.white1 },
        c = { bg = palette.bg_statusline, fg = palette.white0 },
      },
      visual = {
        a = { bg = palette.red.bright, fg = palette.black0, gui = 'bold' },
        b = { bg = palette.gray1, fg = palette.white1 },
        c = { bg = palette.bg_statusline, fg = palette.white0 },
      },
      replace = {
        a = { bg = palette.magenta.bright, fg = palette.black0, gui = 'bold' },
        b = { bg = palette.gray1, fg = palette.white1 },
        c = { bg = palette.bg_statusline, fg = palette.white0 },
      },
      terminal = {
        a = { bg = palette.orange.bright, fg = palette.black0, gui = 'bold' },
        b = { bg = palette.gray1, fg = palette.white1 },
        c = { bg = palette.bg_statusline, fg = palette.white0 },
      },
      inactive = {
        a = { bg = palette.gray2, fg = palette.black0, gui = 'bold' },
        b = { bg = palette.gray1, fg = palette.white1 },
        c = { bg = palette.bg_statusline, fg = palette.white0 },
      },
    }

    return lualine_nordic
  end
}

return nordic
