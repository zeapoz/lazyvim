return {

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  "folke/twilight.nvim",
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
