return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit kind=split<cr>", desc = "Show Neogit UI" },
	},
	config = function() end,
}
