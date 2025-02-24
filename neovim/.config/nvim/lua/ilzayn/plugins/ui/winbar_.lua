return {
  'b0o/incline.nvim',

  event = 'VeryLazy',

  opts = {
    window = {
      padding = 0,
      margin = { vertical = 0, horizontal = 0 },
    },
    hide = {
      only_win = "count_ignored",
    },
    render = function(props)
      local devicons = require('nvim-web-devicons')

      local focused = props.focused

      local filename = vim.fn.fnamemodify(
        vim.api.nvim_buf_get_name(props.buf),
        ':t'
      )
      if filename == '' then
        filename = '[No Name]'
      end

      local icon = devicons.get_icon_color(filename)
      local modified = vim.bo[props.buf].modified

      local highlight_group = ""
      if focused then
        highlight_group = require("ilzayn.utils").get_mode_highlight()
      else
        highlight_group = "inactive_mode"
      end
      local highlight_group_separator = table.concat({ highlight_group, "_reversed" })

      return {
        { "", group = highlight_group_separator },
        icon and { ' ', icon } or '',
        ' ',
        filename,
        modified and { ' ' } or '',
        ' ',
        { "", group = highlight_group_separator },
        group = highlight_group
      }
    end
  },

  config = function(_, opts)
    vim.api.nvim_set_hl(0, "WinSeparator", { link = "inactive_mode_reversed" })

    require("incline").setup(opts)
  end
}
