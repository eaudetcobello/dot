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
		event = "VeryLazy",
		opts = {
			{ options = { disabled_filetypes = { "oil" } } },
		},
	},
	{
		"j-hui/fidget.nvim",
		event = "LspProgress",
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
}
