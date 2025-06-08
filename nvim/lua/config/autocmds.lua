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
