return {
  { "direnv/direnv.vim" },

  {
    "willothy/wezterm.nvim",
    config = true,
    init = function()
      require("wezterm").set_user_var("set_padding", 0)
    end,
  },

  {
    "mrjones2014/smart-splits.nvim",
    config = true,
    lazy = false,
    -- stylua: ignore
    keys = {
      { "<A-Left>", function() require("smart-splits").move_cursor_left() end },
      { "<A-Down>", function() require("smart-splits").move_cursor_down() end },
      { "<A-Up>", function() require("smart-splits").move_cursor_up() end },
      { "<A-Right>", function() require("smart-splits").move_cursor_right() end },
    },
  },
}
