local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- Remove snippet jump history when you change mode.
vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  group = augroup("leave_snippet"),
  pattern = { "s:n", "i:*" },
  callback = function(event)
    local luasnip = require("luasnip")
    while true do
      if luasnip.session and luasnip.session.current_nodes[event.buf] and not luasnip.session.jump_active then
        luasnip.unlink_current()
      else
        break
      end
    end
  end,
})

-- Reset wezterm values.
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  group = augroup("reset_wezterm_padding"),
  callback = function()
    require("wezterm").set_user_var("set_padding", 20)
  end,
})
