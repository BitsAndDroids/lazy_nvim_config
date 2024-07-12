return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = {
      exit_when_last = true,
      close_when_all_hidden = false,
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          ft = "toggleterm",
          size = { height = 0.4 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
      },
      left = {

        {
          title = "Neo-Tree",
          ft = "neo-tree",
          pinned = true,
          open = "Neotree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        "Trouble",
        {
          ft = "qf",
          title = "Quickfix",
        },
        {
          ft = "trouble",
          title = "Troubles",
          filter = function(_buf, win)
            return vim.w[win].trouble.mode == "diagnostics"
          end,
          size = { height = 0.3 },
        },
        {
          ft = "Outline",
          pinned = true,
          open = "OutlineOpen",
        },
      },
    },
  },
}
