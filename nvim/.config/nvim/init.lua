-- Set runtime path to include fzf
vim.opt.rtp:prepend("/opt/homebrew/opt/fzf")

-- Load options file
require("keymaps")
require("options")
require("autocmds")
require("config.lazy")
