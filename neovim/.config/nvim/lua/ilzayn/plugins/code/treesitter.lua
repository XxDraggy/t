return {
  "nvim-treesitter/nvim-treesitter",

  event = { "BufReadPre", },

  build = "<CMD>TSUpdate",

  opts = {
    ensure_installed = {
      "javascript",
      "jsdoc",
      "typescript",
      "css",
      "html",
      "scss",
      "svelte",
      "vue",

      "regex",
      "python",
      "json",

      "c",
      "cpp",
      "c_sharp",
      "cmake",
      "make",

      "rust",

      "vim",
      "vimdoc",
      "lua",
      "luadoc",

      "bash",

      "markdown",
      "markdown_inline",
      "latex",

      "query",
      "gitignore",
      "toml",
    },

    sync_install = false,

    auto_install = true,

    indent = {
      enable = true
    },

    highlight = {
      enable = true,

      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
