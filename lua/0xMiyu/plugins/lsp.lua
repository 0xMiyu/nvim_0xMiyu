-- lsp config
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls", --typescript
					"eslint",
					"jedi_language_server", --python
					"tailwindcss",
					"yamlls",
					"jsonls",
					"marksman",
					"gopls",
					"html",
					"cssls",
					"emmet_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilties = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"html",
				},
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.jedi_language_server.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
				root_dir = require("lspconfig").util.root_pattern(
					"tailwind.config.js",
					"tailwind.config.cjs",
					"tailwind.config.mjs",
					"tailwind.config.ts",
					"postcss.config.js",
					"postcss.config.cjs",
					"postcss.config.mjs",
					"postcss.config.ts",
					"package.json",
					"node_modules",
					".git"
				),
			})

			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.marksman.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
					"markdown",
				},
			})
		end,
	},
}
