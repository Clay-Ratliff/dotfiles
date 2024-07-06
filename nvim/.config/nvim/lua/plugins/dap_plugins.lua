return {
  -- ensure that nvim-dap is loaded first
  {
    "mfussenegger/nvim-dap",
    config = require("plugins.dap").config
  },
  -- nvim-nio needs to load after dap
  {
    "nvim-neotest/nvim-nio",
    after = "nvim-dap",  -- Ensures it loads after nvim-dap
    config = require("plugins.dap_nio").config
  },
  -- DAP UI with its dependencies
  {
    "rcarriga/nvim-dap-ui",
    after = "nvim-nio",
    config = require("plugins.dap_ui").config
  },

  -- DAP Virtual Text
  {
    "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",  -- Ensure it loads after nvim-dap
    config = require("plugins.dap-virtual-text").config
  },

  -- DAP Go
  {
    "leoluz/nvim-dap-go",
    after = "nvim-dap",  -- Ensure it loads after nvim-dap
    config = require("plugins.nvim-dap-go").config
  },

  -- DAP Lua
  {
    "jbyuki/one-small-step-for-vimkind",
    after = "nvim-dap",
    config = require("plugins.nvim-dap-lua").config
  },

  -- DAP python
  {
    "mfussenegger/nvim-dap-python",
    after = "nvim-dap",
    config = require("plugins.dap-python").config
  }
}
