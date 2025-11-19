return {
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
}
