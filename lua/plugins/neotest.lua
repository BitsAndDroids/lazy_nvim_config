return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest", "marilari88/neotest-vitest" },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            env = { CI = true },
          }),
          require("neotest-vitest")({
            vitestCommand = "npx vitest",
          }),
          -- require('neotest-vim-test')({
          --     ignore_file_types = { 'python', 'vim', 'lua' },
          -- }),
        },
        quickfix = {
          enabled = false,
          open = false,
        },
        output_panel = {
          enabled = true,
          open = "rightbelow vsplit | resize 30",
        },
        status = {
          enabled = true,
          virtual_text = false,
          signs = true,
        },
      })
    end,
  },
}
