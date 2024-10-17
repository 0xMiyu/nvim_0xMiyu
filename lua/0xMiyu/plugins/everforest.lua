-- everforest theme
return {
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
}
