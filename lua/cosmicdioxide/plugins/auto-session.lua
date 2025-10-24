return {
	"rmagatti/auto-session",
	-- Use the 'keys' table for mappings, so LazyVim correctly registers them with Which-Key
	keys = {
		{
			"<leader>wr",
			"<cmd>AutoSession restore<CR>",
			mode = "n",
			desc = "Restore session for cwd",
		},
		{
			"<leader>ws",
			"<cmd>AutoSession save<CR>",
			mode = "n",
			desc = "Save session for cwd",
		},
	},
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})
	end,
}
