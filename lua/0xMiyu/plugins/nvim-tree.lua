-- nvim-tree file explorer
return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			-- disable netrw at the very start of your init.lua (strongly advised)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true

			--toggle nvimtree
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

			require("nvim-tree").setup({

				sort_by = "case_sensitive",
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
				-- Automatically close the tree when opening a file
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})
		end,
	},
}
