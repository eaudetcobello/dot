return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
	},
	{
		"jvgrootveld/telescope-zoxide",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
		opts = {},
		config = function()
			require("telescope").load_extension("zoxide")
			require("telescope").load_extension("fzf")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find old files" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
			vim.keymap.set("n", ",", builtin.buffers, { desc = "Buffers" })
			vim.keymap.set("n", "<leader>pp", require("telescope").extensions.zoxide.list)
			-- vim.keymap.set("n", "<leader>fs", function()
			-- 	require("persistence").select()
			-- end)
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>fR", builtin.resume, { desc = "Resume" })
		end,
	},
}
