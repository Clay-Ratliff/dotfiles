return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

	config = function()
		require("dapui").setup()

		-- Debugger mappings
		vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ht",
			":lua require('harpoon.ui').toggle_quick_menu()<CR>",
			{ noremap = true }
		)
	end,
}
