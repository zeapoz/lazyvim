local Util = require("lazyvim.util")

return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, reveal = true, position = "right", dir = Util.root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "right", dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, reveal = true, position = "float", dir = Util.root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "float", dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = { { "<leader>.", Util.telescope("files"), desc = "Find Files (root directory)" } },
    opts = {
      defaults = {
        layout_strategy = "flex",
        layout_config = {
          flex = {
            flip_columns = 120,
          },
        },
        mappings = {
          i = { ["<Esc>"] = require("telescope.actions").close },
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "-g",
            "!.git",
          },
        },
      },
    },
  },
}
