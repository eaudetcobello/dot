return {
	{
		"TheNoeTrevino/no-go.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "go",
		config = function()
			require("no-go").setup({
				identifiers = { "err", "error" },
				fold_imports = true,
			})
			vim.highlight.priorities.semantic_tokens = 95 -- default is 125
			vim.highlight.priorities.treesitter = 100 -- default is 100
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			options = {
				disabled_filetypes = { "oil" },
				section_separators = { left = " ", right = " " },
				component_separators = { left = " ", right = " " },
				icons_enabled = true,
			},
			sections = {
				lualine_x = {},
			},
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			color_icons = true,
			default = true,
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
		event = "LspAttach",
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
