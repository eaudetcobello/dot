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

			-- Files (f prefix)
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>fp", require("telescope").extensions.zoxide.list, { desc = "Projects" })

			-- Buffers (b prefix)
			vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Switch buffer" })
			vim.keymap.set("n", ",", builtin.buffers, { desc = "Switch buffer" })

			-- Search (s prefix)
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Grep" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search word" })
			vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>sS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
			vim.keymap.set("n", "<leader>sR", builtin.resume, { desc = "Resume" })

			-- Help (h prefix)
			vim.keymap.set("n", "<leader>hh", builtin.help_tags, { desc = "Help tags" })

			-- Diagnostics (x prefix, matches trouble)
			vim.keymap.set("n", "<leader>xd", builtin.diagnostics, { desc = "Diagnostics" })
		end,
	},
}
