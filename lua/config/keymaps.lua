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
    local kanagawa = require("kanagawa")
    kanagawa.config.transparent = not kanagawa.config.transparent
    vim.cmd.colorscheme(vim.g.colors_name)
  end
end, { desc = "Toggle background transparency" })
