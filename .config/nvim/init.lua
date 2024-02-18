-- Set runtime path to include fzf
vim.opt.rtp:prepend("/opt/homebrew/opt/fzf")

-- Load options file
require("user.options")
require("user.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "user.autocmds"
    require "user.keymaps"
  end,
})
