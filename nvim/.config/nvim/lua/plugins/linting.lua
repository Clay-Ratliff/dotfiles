return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_fmt = {
			javascript = { "eslint_d" },
			markdown = { "markdownlint" },
			json = { "jsonlint" },
			kotlin = { "klint" },
			lua = { "luacheck" },
			shell = { "shellharden" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		--		vim.keymap.set("n", "<leader>ln", function()
		--			lint.try_lint()
		--		end, { desc = "Trigger linting for current file" })
	end,
}
