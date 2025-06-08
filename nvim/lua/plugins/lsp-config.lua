return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   lazy = false,
  --   config = function()
  --     vim.diagnostic.config({
  --       virtual_text = true,
  --       signs = true,
  --       underline = true,
  --       severity_sort = true, -- fixed typo
  --     })
  --
  --     vim.keymap.set("n", "K", function()
  --       vim.diagnostic.open_float(nil, { focusable = false })
  --     end)
  --
  --     local capabilities = require("cmp_nvim_lsp").default_capabilities()
  --     local lspconfig = require("lspconfig")
  --
  --     -- TypeScript / JavaScript
  --     lspconfig.tsserver.setup({
  --       capabilities = capabilities,
  --     })
  --
  --     -- Vue / Nuxt via Volar
  --     lspconfig.volar.setup({
  --       capabilities = capabilities,
  --       filetypes = { "vue", "typescript", "javascript" },
  --       init_options = {
  --         typescript = {
  --           tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib",
  --         },
  --       },
  --     })
  --
  --     -- Ruby
  --     lspconfig.solargraph.setup({
  --       capabilities = capabilities,
  --     })
  --
  --     -- HTML
  --     lspconfig.html.setup({
  --       capabilities = capabilities,
  --     })
  --
  --     -- Lua
  --     lspconfig.lua_ls.setup({
  --       capabilities = capabilities,
  --     })
  --
  --     -- Julia
  --     lspconfig.julials.setup({
  --       capabilities = capabilities,
  --       on_new_config = function(new_config, _)
  --         local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
  --         if require("lspconfig").util.path.is_file(julia) then
  --           new_config.cmd[1] = julia
  --         end
  --       end,
  --     })
  --
  --     -- Mojo
  --     lspconfig.mojo.setup({
  --       cmd = { "mojo-lsp-server" },
  --       single_file_support = true,
  --       capabilities = capabilities,
  --       filetypes = { "mojo", "*.🔥" },
  --     })
  --
  --     -- Keymaps
  --     vim.keymap.set("n", "m", vim.lsp.buf.hover, {})
  --     vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
  --     vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
  --     vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
  --   end,
  -- },
}
