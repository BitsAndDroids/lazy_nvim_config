return {
  { "nvim-neotest/neotest-jest" },
  { "rouge8/neotest-rust" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "npm test --",
          env = { CI = true },
        },
        ["neotest-rust"] = {},
      },
    },
  },
}
