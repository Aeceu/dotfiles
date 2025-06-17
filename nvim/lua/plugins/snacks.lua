return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        files = {
          hidden = true,
        },
        hidden = true,
        ignore = true,
      },
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
            ██╗  ██╗██████╗ ██╗   ██╗ ██████╗ ███████╗██████╗ 
            ██║ ██╔╝██╔══██╗██║   ██║██╔════╝ ██╔════╝██╔══██╗
            █████╔╝ ██████╔╝██║   ██║██║  ███╗█████╗  ██████╔╝
            ██╔═██╗ ██╔══██╗██║   ██║██║   ██║██╔══╝  ██╔══██╗
            ██║  ██╗██║  ██║╚██████╔╝╚██████╔╝███████╗██║  ██║
            ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝
          ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", index = 2, padding = 2 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
          { section = "startup" },
        },
      },
    },

    -- ✅ Keybindings declared properly
    keys = {
      {
        "<leader>e",
        function()
          require("snacks").picker("explorer", { cwd = vim.fn.getcwd() })
        end,
        desc = "Explorer (cwd)",
      },
      {
        "<leader>E",
        function()
          require("snacks").picker("explorer", { cwd = LazyVim.root() })
        end,
        desc = "Explorer (root dir)",
      },
    },
  },
}
