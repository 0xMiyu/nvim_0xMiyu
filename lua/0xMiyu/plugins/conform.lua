-- conform formatter
return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_fix" },
					rust = { "rustfmt" },
					javascript = { "prettier", stop_after_first = true },
					javascriptreact = { "prettier", stop_after_first = true },
					typescript = { "prettier", stop_after_first = true },
					typescriptreact = { "prettier", stop_after_first = true },
					go = { "gofumpt", "golines", "goimports-reviser" },
					cpp = { "clang_format" },
					yaml = { "yamlfmt" },
					html = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
