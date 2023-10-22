local Util = require("lazyvim.util")

return {
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
}
