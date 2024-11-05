return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("kanagawa").setup({
				on_colors = function(colors) end,
				theme = "dragon",
				background = {
					dark = "dragon",
					light = "lotus",
				},
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
