local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
				},
			})
		end,
	},

	-- catppuccin theme
	--  { "catppuccin/nvim", name = "catppuccin"}

	{
		"neanias/everforest-nvim",
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				background = "medium",
				transparent_background_level = 1,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"rust",
				"javascript",
				"typescript",
				"java",
				"python",
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"vonheikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- lsp support
			{ "neovim/nvim-lspconfig" }, -- required
			{ -- optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "masonupdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- optional

			-- autocompletion
			{ "hrsh7th/nvim-cmp" }, -- required
			{ "hrsh7th/cmp-nvim-lsp" }, -- required
			{ "l3mon4d3/luasnip" }, -- required
		},
	},

	--undotree
	"mbbill/undotree",

	-- autopair general and html elements
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- code formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
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
	--git
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	--file explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	--harpoon
	"theprimeagen/harpoon",

	--nvim tmux navigator
	{ "alexghergh/nvim-tmux-navigation" },

	--barbar (tabline)
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {

			animation = false,
			clickable = true,
			icons = {
				-- Configure the base icons on the bufferline.
				-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
				buffer_index = false,
				buffer_number = false,
				button = "",
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
					[vim.diagnostic.severity.WARN] = { enabled = false },
					[vim.diagnostic.severity.INFO] = { enabled = false },
					[vim.diagnostic.severity.HINT] = { enabled = true },
				},
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = true,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = "▎", right = "" },

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = { button = "●" },
				pinned = { button = "", filename = true },

				-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
				preset = "default",

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = true },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},
			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = nil}
				NvimTree = true,
				-- Or, specify the text used for the offset:
				undotree = { text = "undotree" },
				-- Or, specify the event which the sidebar executes when leaving:
				["neo-tree"] = { event = "BufWipeout" },
				-- Or, specify both
				Outline = { event = "BufWinLeave", text = "symbols-outline" },
			},
		},
	},

	--copilot
	-- "github/copilot.vim",

	--comment (auto commenting plugin)
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- neorg with treesitter patch
	{
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
				},
			})

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},

	--surround tags
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup({
				-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
				highlight_duration = 500,

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "ma", -- Add surrounding in Normal and Visual modes
					delete = "md", -- Delete surrounding
					find = "mf", -- Find surrounding (to the right)
					find_left = "mF", -- Find surrounding (to the left)
					highlight = "mh", -- Highlight surrounding
					replace = "mr", -- Replace surrounding
					update_n_lines = "mn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},

				-- Number of lines within which surrounding is searched
				n_lines = 100,
			})
		end,
	},
}

require("lazy").setup(plugins, {})
