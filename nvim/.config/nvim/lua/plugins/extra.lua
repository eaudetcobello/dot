return {
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
}
