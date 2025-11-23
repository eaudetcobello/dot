return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		build = ":TSUpdate",
		opts = {
			indent = { enable = true },
			highlight = { enable = true },
			folds = { enable = true },
		},
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "go", "lua", "rust", "elixir", "zig", "ruby" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		branch = "main",
		event = "VeryLazy",
	},
}
