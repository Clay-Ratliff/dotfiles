return {
  "mfussenegger/nvim-dap-python",
  config = function()
    require("dap-python").setup(
      "/Users/clay.ratliff/.config/nvim/python/debug/venv/bin/python"
    )
  end
}
