return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", },

  dependencies = {
    "Saghen/blink.cmp",
    "williamboman/mason.nvim",

    {
      "williamboman/mason-lspconfig.nvim",

      opts = {
        ensure_installed = {
          "lua_ls",                 -- lua
          "bashls",                 -- bash
          "clangd",                 -- c, c++, c#
          -- "cmake",                  -- make
          "cssls",                  -- css, scss, less
          "tailwindcss",            -- tailwindcss
          "emmet_language_server",  -- emmet
          "html",                   -- html
          "htmx",                   -- htmx
          -- "java_language_server",
          "eslint",                 -- javascript, typescript
          "jsonls",                 -- json
          "marksman",               -- markdown
          "ruff",                   -- python
          "rust_analyzer",          -- rust
          "svelte",                 -- svelte
          "vuels",                  -- vue.js
          "taplo",                  -- toml
        },
        handlers = {
          function(server_name)
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            require("lspconfig")[server_name].setup({
              capabilities = capabilities
            })
          end
        }
      },
    },
  },
  config = function()
    local diagnostic_icons = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    }
    for severity, icon in pairs(diagnostic_icons) do
      local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    vim.diagnostic.config({
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        -- prefix = function(diagnostic)
        --   for d, icon in pairs(diagnostic_icons) do
        --     if diagnostic.severity == d then
        --       return icon
        --     end
        --   end
        --   return "●"
        -- end
      },
      severity_sort = true,
    })
  end
}
