return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
        background_colour = "#000000",
        enabled = true,
      })
    vim.notify = require("notify")
  end
}
