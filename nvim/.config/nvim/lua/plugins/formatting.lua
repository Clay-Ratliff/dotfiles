return {
	"stevearc/conform.nvim",
	events = { "BuffReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				-- python = { "isort", "black" },
				terraform = { "terraform_fmt" },
				json = { "jq" },
				java = { "google-java-format" },
				kotlin = { "ktlint" },
				markdown = { "mdformat" },
				lua = { "stylua" },
				bash = { "shellharden" },
				sql = { "pg_format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
