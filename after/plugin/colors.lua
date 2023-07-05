function setColor(color)
    color = color or "catppuccin"
    --require("everforest").setup({
    --    background = "medium",
    --    transparent_background_level = 100,
    --})
	--color = color or "everforest"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })	
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

setColor()


