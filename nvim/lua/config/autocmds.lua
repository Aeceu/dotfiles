function RemoveKittyPadding()
  local socket = vim.env.KITTY_LISTEN_ON
  if socket then
    vim.fn.jobstart({ "kitty", "@", "--to", socket, "set-spacing", "padding=0" })
  end
end

vim.api.nvim_set_keymap("n", "<leader>zp", ":lua RemoveKittyPadding()<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = RemoveKittyPadding,
})

vim.cmd([[
  highlight VertSplit guifg=#ff8800 guibg=NONE
]])

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[highlight WinSeparator guifg=#7dcfff guibg=NONE]])
  end,
})

-- apply it immediately as well
vim.cmd([[highlight WinSeparator guifg=#7dcfff guibg=NONE]])

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    vim.wo.winhighlight = "WinSeparator:CustomWinSeparator"
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    vim.wo.winhighlight = "WinSeparator:CustomWinSeparatorInactive"
  end,
})

vim.cmd("highlight CustomWinSeparator guifg=#7dcfff guibg=NONE")
vim.cmd("highlight CustomWinSeparatorInactive guifg=#7dcfff guibg=NONE")
