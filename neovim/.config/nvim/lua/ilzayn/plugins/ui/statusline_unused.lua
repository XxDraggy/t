local function width_less_than(width)
  return function() return vim.opt.columns <= width end
end

local function width_more_than(width)
  return function() return vim.opt.columns > width end
end

return {
  cond = false,
  "nvim-lualine/lualine.nvim",

  -- event = { "BufReadPre" },

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function(_, opts)
    -- MAKE SHURE THESE EXIST
    if not opts.options then
      opts.options = { }
    end
    if not opts.extensions then
      opts.extensions = { }
    end

    -- THEME
    local theme = require("ilzayn.scheme").lualine()

    theme.normal.b = theme.normal.a
    theme.visual.b = theme.visual.a
    theme.insert.b = theme.insert.a
    theme.command.b = theme.command.a
    theme.terminal.b = theme.terminal.a
    theme.replace.b = theme.replace.a

    -- make section a and z invisible
    theme.normal.a = { fg = "", bg = "" }
    theme.visual.a = { fg = "", bg = "" }
    theme.insert.a = { fg = "", bg = "" }
    theme.command.a = { fg = "", bg = "" }
    theme.terminal.a = { fg = "", bg = "" }
    theme.replace.a = { fg = "", bg = "" }

    -- remove background of every other section
    theme.normal.c = { bg = "" }
    theme.visual.c = { bg = "" }
    theme.insert.c = { bg = "" }
    theme.command.c = { bg = "" }
    theme.terminal.c = { bg = "" }
    theme.replace.c = { bg = "" }
    theme.inactive.a = { bg = "" }
    theme.inactive.b = { bg = "" }
    theme.inactive.c = { bg = "" }

    opts.options.theme = theme

    -- EXTENSIONS
    local function name_extension(filetypes, name)
      local extension = { }

      extension.filetypes = filetypes
      extension.sections = vim.tbl_extend(
        "keep",
        { lualine_c = { "%=", function() return name end } },
        opts.sections
      )

      return extension
    end

    -- oil
    local oil = name_extension({ "oil" }, "Oil")
    opts.extensions[#opts.extensions+1] = oil

    -- lazy
    local lazy = name_extension({ "lazy" }, "Lazy")
    opts.extensions[#opts.extensions+1] = lazy

    -- telescope
    local telescope = name_extension({ "TelescopePrompt" }, "Telescope")
    opts.extensions[#opts.extensions+1] = telescope

    -- trouble
    local trouble = require("lualine.extensions.trouble")
    require('trouble.config').setup()
    trouble.filetypes = { "trouble" }
    trouble.sections = {
      lualine_a = {
        {
          function() return "  " end,
          padding = 0
        }
      },
      lualine_b = {
        {
          trouble.sections.lualine_a[1],
        }
      },
      lualine_c = {
        "%=",
        function() return "Trouble" end
      },
      lualine_x = { },
      lualine_y = { },
      lualine_z = { },
    }
    opts.extensions[#opts.extensions+1] = trouble

    require("lualine").setup(opts)
  end,

  opts = {
    options = {
      globalstatus = true,
      disabled_filetypes = {
        statusline = { "snacks_dashboard" }
      },
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_a = {
        {
          function()
            if width_more_than(40)() then
              return "  "
            end

            return " "
          end,
          padding = 0,
        }
      },
      lualine_b = {
        {
          "mode",
          separator = { left = "", right = "" },
          fmt = function(str)
            if width_more_than(40)() == true then
              return str
            end

            return str:sub(1, 1)
          end
        },
      },
      lualine_c = {
        "%=",
        {
          "filetype",
          -- colored = false,
          icon_only = true,
          padding = 0,
          cond = width_more_than(40)
        },
        {
          "filename",
          path = 0,
          symbols = {
            modified = '[]',
            readonly = '[󰌾]',
            unnamed = '[No Name]',
            newfile = '[+]',
          },
          shorting_target = 0,
          padding = { left = 0, right = 2 },
          cond = width_more_than(35)
        },
        {
          "filetype",
          colored = false,
          icons_enabled = false,
          padding = { left = -1 },
          cond = width_more_than(70),
          fmt = function(str)
            if str == "" then
              return ""
            end

            return "|  "..str
          end
        }
      },
      lualine_x = {
        {
          "filename",
          path = 0,
          symbols = {
            modified = '[]',
            readonly = '[󰌾]',
            unnamed = '[No Name]',
            newfile = '[+]',
          },
          shorting_target = 0,
          cond = width_less_than(35)
        },
      },
      lualine_y = {
        {
          "progress",
          separator = { left = "" },
          cond = width_more_than(70),
          fmt = function(str, _)
            return " "..vim.trim(str).." "
          end
        },
        {
          function() return "|" end,
          padding = -1,
          cond = width_more_than(70)
        },
        {
          "location",
          separator = { right = "" },
          cond = width_more_than(70),
          fmt = function(str, _)
            return " "..vim.trim(str).." "
          end
        },
        {
          "location",
          separator = { left = "", right = "" },
          cond = function()
            return width_more_than(50)() and width_less_than(70)()
          end,
          fmt = function(str, _)
            return " "..vim.trim(str).." "
          end
        },
        {
          "location",
          separator = { left = "", right = "" },
          cond = function()
            return width_more_than(35)() and width_less_than(50)()
          end,
          fmt = function(str, _)
            return vim.trim(str)
          end
        },
      },
      lualine_z = {
        {
          function()
            if width_more_than(40)() then
              return "  "
            end

            return " "
          end,
          padding = 0,
        }
      }
    },
    inactive_sections = {
      lualine_a = { },
      lualine_b = { },
      lualine_c = {
        "%=",
        {
          "filename",
          path = 1,
          shorting_target = 0,
          cond = width_more_than(60)
        },
        {
          "filename",
          path = 0,
          shorting_target = 0,
          cond = width_less_than(60)
        },
        {
          "filetype",
          colored = false,
          icon_only = true,
          padding = -1,
        },
      },
      lualine_x = { },
      lualine_y = { },
      lualine_z = { }
    },
  }
}
