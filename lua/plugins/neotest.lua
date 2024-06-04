return {
  {
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
    event = "BufRead",
  },
  {
    "nvim-neotest/neotest-jest",
    after = "nvim-neotest/neotest",
  },
}
