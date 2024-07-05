-- Reload the file when if it's changed while out of focus
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- Go to last location in the file when opening a buffer
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  callback = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "<buffer>",
      once = true,
      callback = function()
        vim.cmd(
          [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
        )
      end,
    })
  end,
})

-- basic session autosave 
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("mksession! ~/.cache/nvim/sessions/auto.vim")
  end
})

-- basic session autoload
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if #vim.v.argv == 1 then  -- Checks if NeoVim was started without file arguments
      vim.cmd("source ~/.cache/nvim/sessions/autosave.vim")
    end
  end
})

-- highlight text on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
