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

require("lazy").setup("0xMiyu.plugins", {
	default = {
		lazy = true,
	},
})

function setColor(color)
	color = color or "everforest"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

setColor()

-- barbar keybinds
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next buffer
map("n", "≤", "<Cmd>BufferPrevious<CR>", opts)
map("n", "≥", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next buffer
map("n", "…", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "æ", "<Cmd>BufferMoveNext<CR>", opts)

-- Close buffer
map("n", "ç", "<Cmd>BufferClose<CR>", opts)
