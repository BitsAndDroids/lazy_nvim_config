return {
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        arduino_language_server = { languages = { "cpp", "h" } },
        codespell = { languages = { "md" } },
        tsserver = {},
        rust_analyzer = {},
        angularls = {
          root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json"),
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        rust_analyzer = function(_, opts)
          require("rust-tools").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "arduino_language_server",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "clangd",
      },

      servers = {
        arduino_language_server = { languages = { "cpp", "h" } },
      },
    },
  },
}
