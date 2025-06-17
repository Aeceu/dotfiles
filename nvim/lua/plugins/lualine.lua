return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          -- theme = "gruvbox_dark",
          section_separators = "",
          component_separators = "|",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            {
              "branch",
              icon = "",
              fmt = function(str)
                return "branch: " .. str
              end,
            },
            "diff",
          },
          lualine_c = {
            "filename",
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " " },
            },
          },
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
