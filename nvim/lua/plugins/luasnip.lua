-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")

    -- Load snippets from lua/snippets/
    require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/snippets" } })

    -- Register the snippet for JavaScript and extend it to others
    ls.filetype_extend("typescript", { "javascript" })
    ls.filetype_extend("vue", { "javascript" })
    ls.filetype_extend("javascriptreact", { "javascript" })
    ls.filetype_extend("typescriptreact", { "javascript" })

    -- Optional: keymaps for expanding/jumping
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })
  end,
}
