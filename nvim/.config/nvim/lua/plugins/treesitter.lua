return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		build = ":TSUpdate",
		opts = {
			indent = { enable = true }, ---@type lazyvim.TSFeat
			highlight = { enable = true }, ---@type lazyvim.TSFeat
			folds = { enable = true },
		},
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "go", "lua", "rust", "elixir", "zig" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		event = "VeryLazy",
	},
}
