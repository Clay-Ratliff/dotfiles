-- I don't like to type a lot
local opt = vim.opt

opt.guicursor = ""

-- line numbers
opt.nu = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.incsearch = true
opt.smartindent = true

-- line and border settings
opt.wrap = false
opt.cc = "100" -- column width to 100, I'm not working on a Commodore PET anymore

-- search setttings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.showmatch = true
opt.incsearch = true
opt.shortmess = opt.shortmess + "S"

-- appearence
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"
opt.ruler = true
opt.showmode = true
opt.showcmd = true
opt.updatetime = 300 -- I find the default of 4000ms too slow

-- folding
opt.foldenable = true
opt.foldmethod = "indent"
opt.foldlevelstart = 1 -- start folding at 5 nest levels

--allow backspace on indent, eol, or insert mode start position
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
opt.autowrite = true
opt.autowriteall = true
opt.guicursor = "a:block,i-ci-ve:ver50,a:blinkwait300-blinkoff300-blinkon300-Cursor"
opt.spell = true
opt.spelllang = "en_us"

-- completions
opt.wildmode = "longest,list" -- bash-like tab completion

--session persistence and backup
opt.writebackup = true
opt.backupdir = "/Users/clay.ratliff/.cache/nvim"
opt.history = 1000
opt.undofile = true
opt.undodir = "/Users/clay.ratliff/.cache/nvim/undo"
vim.g.sessions_dir = "/Users/clay.ratliff/.cache/nvim/sessions"

-- buffers
opt.hidden = true -- don't ask me to save when I change buffers
