return {
  "williamboman/mason.nvim",

  event = { "BufReadPre", },
  cmd = {
    "Mason",
    "MasonUpdate",
    "MasonInstall",
    "MasonLog",
    "MasonUninstall",
    "MasonUnistallAll",
  },

  build = ":MasonUpdate",

  opts = {
    ui = {
      border = "rounded",
      height = 0.8,
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
}
