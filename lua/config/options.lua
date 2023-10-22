local g = vim.g
local opt = vim.opt

-- Wrap.
opt.showbreak = "󱞩 "

opt.fillchars = {
  eob = " ", -- Disable end of buffers tildes (~).
  -- Disable vertical view splits.
  vert = " ",
  vertleft = "─",
  vertright = "─",
  verthoriz = "─",
  horizup = "─",
  horizdown = "─",
}
opt.listchars = {
  precedes = "«",
  trail = "·",
}

-- Neovide settings.
if g.neovide then
  g.neovide_transparency = 0.8
  opt.guifont = "FiraCode Nerd Font"
end
