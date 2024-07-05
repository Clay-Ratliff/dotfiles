return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  config = function()
    local has_noice, noice = pcall(require, "noice")
    if not has_noice then
      vim.notify("noice.nvim is not installed!", vim.log.levels.ERROR)
      return
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_x = {
          {
            noice.api.statusline.mode.get,
            cond = noice.api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            noice.api.status.command.get,
            cond = noice.api.status.command.has,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_a = { "buffers" }
      }
    }
  end
}

