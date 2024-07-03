local keymap = vim.keymap -- I'm lazy

-- Pane navigation
keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to the left pane" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move down one pane" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to up one pane" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to the right pane" })

-- Resize window using <shift> arrow keys
keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>")
keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>")
keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>")
