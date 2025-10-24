return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	-- Use the config function to run setup code when the plugin loads
	config = function()
		require("ibl").setup({})
	end,
}
