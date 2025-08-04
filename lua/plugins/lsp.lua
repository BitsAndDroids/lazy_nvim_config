return {
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "clangd",
      },

      servers = {},
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      format = { timeout_ms = 6000 },
      capabilities = {
        positionEncodings = { "utf-16" },
        textDocument = {
          positionEncoding = "utf-16",
        },
      },
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
        rust_analyzer = {
          capabilities = {
            general = {
              positionEncodings = { "utf-16" },
            },
            positionEncodings = { "utf-16" },
            textDocument = {
              positionEncodings = "utf-16",
            },
            offsetEncoding = "utf-16",
          },
        },
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
          require("typescript").setup({
            server = opts,
            capabilities = { general = { positionEncodings = { "utf-16" } } },
          })
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
}
