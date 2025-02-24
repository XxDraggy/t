return {
  "Saghen/blink.cmp",

  version = "v0.*",

  event = { "BufReadPre", },

  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*"
    },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    "mikavilpas/blink-ripgrep.nvim",
    "Shatur/neovim-ayu"
  },

  opts = {
    keymap = {
      -- TODO:
      ['<C-a>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-Space>'] = {},

      ['<C-h>'] = { 'hide' },
      ['<C-z>'] = { 'select_and_accept' },

      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-U>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-D>'] = { 'scroll_documentation_down', 'fallback' },

      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },
    completion = {
      menu = {
        border = "rounded",
        scrollbar = false,

        draw = {
          columns = {
            { 'kind_icon' },
            { 'label', 'label_description', gap = 1 },
            { "source_name" },
          },
        }
      },
      documentation = {
        window = {
          border = "rounded",
          scrollbar = false
        }
      },
      accept = {
        auto_brackets = {
          enabled = false
        }
      }
    },
    snippets = {
      preset = "luasnip",
    },
    sources = {
      default = { "lsp", "path", "snippets","lazydev", "buffer", "ripgrep" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
        }
      },
    },
  },

  config = function(_, opts)
    require("blink-cmp").setup(opts)

    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "Normal" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { italic = true })
  end
}
