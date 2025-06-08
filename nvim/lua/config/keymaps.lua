-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Word wrap

vim.keymap.set("n", "<leader>cw", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.cmd("redrawstatus") -- force lualine to refresh
  print("Wrap: " .. (vim.wo.wrap and "ON" or "OFF"))
end, { desc = "Toggle Word Wrap" })
