return {
  "folke/snacks.nvim",

  priority = 1000,

  lazy = false,

  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[                                                                       
                                                                    
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
	                                                                       ]],
        keys = {
          {
            icon = "󰍉",
            desc = "Find Files",
            key = "f",
            action = "<CMD>Telescope find_files<CR>",
          },
          {
            icon = "󰦨",
            desc = "Find Text",
            key = "g",
            action = "<CMD>Telescope live_grep<CR>",
          },
          {
            icon = "",
            desc = "Explore Files",
            key = "e",
            action = "-",
          },
          {
            icon = "",
            desc = "Config",
            key = "c",
            action = function()
              vim.cmd.cd(vim.api.nvim_list_runtime_paths()[1])
              vim.cmd.Oil("--float")
            end,
          },
          {
            icon = "󰒲",
            desc = "Lazy",
            key = "l",
            action = "<CMD>Lazy<CR>",
          },
          {
            icon = "",
            desc = "Mason",
            key = "m",
            action = "<CMD>Mason<CR>",
          },
          {
            icon = "󰈆",
            desc = "Quit",
            key = "q",
            action = "<CMD>qa<CR>",
          },
        }
      },
      sections = {
        { section = "header", padding = 3 },
        { section = "keys", gap = 1, padding = 10 },
        { section = "startup" },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },

    styles = {
      notification_history = {
        backdrop = false
        -- minimal = true
      },
    }
  },

  keys = {
    { "<leader>m", function() require("snacks").notifier.show_history() end, desc = "[m]essage history" }
  }
}
