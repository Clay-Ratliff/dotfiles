-- Set runtime path to include fzf
vim.opt.rtp:prepend("/opt/homebrew/opt/fzf")

-- set mapleader early
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load options, keymaps, autocommands, and lazy file
require("keymaps")
require("options")
require("autocmds")
require("config.lazy")
