-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- add zz to C-d and C-u
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>o", "o <Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>O", "O <Esc>", { noremap = true })
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true })

_G.foo_tobar = function()
  return "console.log('\x1b[36mDR LOG:\x1b[0m', );"
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>cp",
  ":lua vim.api.nvim_put({foo_tobar()}, 'c', true, true)<CR>:lua vim.api.nvim_feedkeys('2hi', 'n', true)<CR>",
  { noremap = true, silent = true }
)
