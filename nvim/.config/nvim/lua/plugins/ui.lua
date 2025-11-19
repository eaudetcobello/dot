return {
	{
		"TheNoeTrevino/no-go.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "go",
		opts = {
			identifiers = { "err", "error" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 10,
		opts = {
			overwrite = {
				search = { enabled = true },
				undo = { enabled = true },
				redo = { enabled = true },
			},
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				transparent_cursorline = true,
				hi = {
					background = "NotifyBackground",
				},
				options = {
					throttle = 0,
					show_related = {
						enabled = false,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
	{
		"neanias/everforest-nvim",
		config = function()
			vim.cmd([[colorscheme everforest]])
		end,
	},
	{
		"stevearc/oil.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		lazy = false,
		config = function()
			require("oil").setup({
				skip_confirm_for_simple_edits = true,
				watch_for_changes = true,
			})
			vim.keymap.set("n", "-", require("oil").open, { desc = "Open Oil" })
		end,
	},
}
