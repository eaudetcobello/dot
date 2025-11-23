return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
		{ "<leader>fe", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Focus and Toggle File Explorer" },
	},
	config = function()
		require("nvim-tree").setup({
			sync_root_with_cwd = true,
		})
	end,
}
