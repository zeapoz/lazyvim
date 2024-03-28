return {
  { "direnv/direnv.vim" },
  {
    "willothy/wezterm.nvim",
    config = true,
    init = function()
      require("wezterm").set_user_var("set_padding", 0)
    end,
  },
}
