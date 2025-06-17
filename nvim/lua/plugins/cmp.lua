local M = {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  enabled = false,

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "rafamadriz/friendly-snippets",
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
        create_cmp_source = true,
      },
    },
    {
      "petertriho/cmp-git",
      ft = { "gitcommit", "gitrebase", "gitconfig", "gitignore", "gitattributes" },
      config = true,
    },
  },

  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "git" })
  end,

  config = function(_, opts)
    local cmp = require("cmp")

    cmp.setup(vim.tbl_extend("force", {
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({
          select = false,
          behavior = cmp.ConfirmBehavior.Replace,
        }),
        ["<CR>"] = cmp.mapping.confirm({
          select = false,
          behavior = cmp.ConfirmBehavior.Replace,
        }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.snippet.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
    }, opts))

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })
  end,
}

return M
