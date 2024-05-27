if not vim.g.vscode then
  return {}
end

local enabled = {
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
  "mini.ai",
  "mini.comment",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "vim-repeat",
  "LazyVim",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

local function map_vscode(mode, key, command)
  vim.keymap.set(mode, key, "<cmd>call VSCodeNotify(\'" .. command .. "\')<cr>")
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>f", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>.", "<cmd>Find<cr>")
    map_vscode("n", "<leader>e", "workbench.view.explorer")
    map_vscode("n", "<leader>/", "workbench.action.findInFiles")
    map_vscode("n", "<leader>s", "workbench.action.gotoSymbol")
    map_vscode("n", "<leader>S", "workbench.action.showAllSymbols")
    map_vscode("n", "<leader>r", "editor.action.rename")
    map_vscode("n", "<leader>a", "editor.action.quickFix")
    map_vscode("n", "gr", "references-view.findReferences")
    map_vscode("n", ";", "workbench.action.showCommands")
    map_vscode("n", "]d", "editor.action.marker.nextInFiles")
    map_vscode("n", "[d", "editor.action.marker.prevInFiles")
    map_vscode("n", "<leader>b", "workbench.action.toggleSidebarVisibility")
    -- Reload configuration.
    map_vscode("n", "<leader>R", "vscode-neovim.restart")
  end,
})

return {
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
