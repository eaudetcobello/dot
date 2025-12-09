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
		"nvim-telescope/telescope-live-grep-args.nvim",
		version = "1.1.0",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
		opts = {},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("zoxide")
			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")

			local builtin = require("telescope.builtin")

			-- Files (f prefix)
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>fp", telescope.extensions.zoxide.list, { desc = "Projects" })

			-- Buffers (b prefix)
			vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Switch buffer" })
			vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Switch buffer" })

			-- Search (s prefix)
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Grep" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search word" })
			vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>sS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
			vim.keymap.set("n", "<leader>sR", builtin.resume, { desc = "Resume" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
		end,
	},
}
