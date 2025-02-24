return {
  "folke/noice.nvim",

  event = "VeryLazy",

  dependencies = {
    "MunifTanjim/nui.nvim",
  },

  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = 0.2,
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 18,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      }
    },
    cmdline = {
      opts = {
        border = {
          text = {
            top = " Command Line ",
          },
        }
      }
    },
    messages = {
      enabled = false
    },
    notify = {
      enabled = false
    },
    lsp = {
      progress = {
        enabled = false
      },
      hover = {
        enabled = false
      },
      signature = {
        enabled = false
      },
      messages = {
        enabled = false
      },
    },
  },
}
