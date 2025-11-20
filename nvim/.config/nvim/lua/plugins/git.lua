return {
	{
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
	},
	{
		"linrongbin16/gitlinker.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>go",
				function()
					vim.cmd("silent! GitLink! default_branch")
				end,
				desc = "Open repository in browser",
			},
		},
	},
}
