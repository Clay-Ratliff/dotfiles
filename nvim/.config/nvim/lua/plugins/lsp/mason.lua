return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- autoconfigure mason tooling
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"dockerls",
				"bashls",
				"lua_ls",
				"pyright",
				"jsonls",
				"marksman",
				"terraformls",
				"dart",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"luacheck", -- Lua linter
				"stylua", -- lua formatter
				"isort", -- python formatter
				--				"black", -- python formatter
				--				"pylint", -- python linter
				"eslint_d", -- js linter
				"jsonlint", -- JSON linter
				"shellharden", -- shell script linter
				"markdownlint", -- Markdown linter
			},
		})
	end,
}
