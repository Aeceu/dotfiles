return {
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(highlights)
        highlights.WinSeparator = { fg = "#7dcfff", bg = "NONE" }
      end,
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}

-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     opts = {
--       terminal_colors = true, -- enable terminal colors
--       transparent_mode = true,
--       dim_inactive = false,
--       contrast = "soft",
--     },
--     config = function(_, opts)
--       require("gruvbox").setup(opts)
--       vim.cmd.colorscheme("gruvbox")
--     end,
--   },
-- }
