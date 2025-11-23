return {
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
		-- "neanias/everforest-nvim",
		-- config = function()
		-- 	vim.cmd([[colorscheme everforest]])
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},
}
