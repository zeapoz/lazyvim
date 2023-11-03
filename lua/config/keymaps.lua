local function map(mode, key, command, opts)
  vim.keymap.set(mode, key, command, opts)
end

-- Center view after scrolling.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Toggle opaque background.
map("n", "<leader>uo", function()
  if vim.g.neovide then
    if vim.g.neovide_transparency < 1 then
      vim.g.neovide_transparency = 1
    else
      vim.g.neovide_transparency = 0.8
    end
  else
    -- Update wezterm opacity.
    require("wezterm").set_user_var("toggle_opacity")
  end
end, { desc = "Toggle background transparency" })
