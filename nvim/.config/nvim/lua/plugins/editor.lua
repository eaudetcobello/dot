return {
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"ibhagwan/fzf-lua", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit kind=split<cr>", desc = "Show Neogit UI" },
		},
		config = function() end,
	},
	{
		"nanotee/zoxide.vim",
		config = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "ZoxideDirChanged",
				callback = function()
					vim.defer_fn(function()
						require("oil").open(vim.loop.cwd())
					end, 10) -- 10ms delay
				end,
			})
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", function()
				require("flash").jump()
			end, { desc = "Flash" })
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {
			follow = false,
			focus = true,
		},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					require("grug-far").open()
				end,
				desc = "Search and replace",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		opts = {},
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "go", "lua", "rust", "elixir" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
