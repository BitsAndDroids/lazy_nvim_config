local js_based_languages = { "javascript", "typescript", "typescriptreact", "javascriptreact" }

return {

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
  {
    "LintaoAmons/scratch.nvim",
    tag = "v0.13.2",
    event = "VeryLazy",
  },
  {
    "metakirby5/codi.vim",
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      local Config = require("lazyvim.config")

      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(Config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}", --let both ports be the same for now...
        executable = {
          command = "node",
          -- -- 💀 Make sure to update this path to point to your installation
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
          -- command = "js-debug-adapter",
          -- args = { "${port}" },
        },
      }

      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Debug single nodejs files
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node)",
            cwd = "${workspaceFolder}", -- vim.fn.getcwd(),
            args = { "${file}" },
            sourceMaps = true,
            protocol = "inspector",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (Typescript)",
            cwd = "${workspaceFolder}",
            runtimeArgs = { "--loader=ts-node/esm" },
            program = "${file}",
            runtimeExecutable = "node",
            -- args = { '${file}' },
            sourceMaps = true,
            protocol = "inspector",
            outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
        }
      end
    end,
    keys = {
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
    },
  },
}
