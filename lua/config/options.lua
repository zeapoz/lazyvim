local opt = vim.opt

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
