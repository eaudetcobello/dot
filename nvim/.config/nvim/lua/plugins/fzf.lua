return {
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		config = function()
			local fzf = require("fzf-lua")

			fzf.setup({
				{ "fzf-native" },
				winopts = {
					preview = {
						hidden = "hidden",
						delay = 0,
					},
				},
				defaults = {
					file_ignore_patterns = { "node_modules/", "vendor/", "target/" },
					git_icons = true,
				},
			})

			vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "Find git files" })
			vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Find old files" })
			vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Find help tags" })
			vim.keymap.set("n", ",", fzf.buffers, { desc = "Buffers" })

			vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "Grep" })
			vim.keymap.set("n", "<leader>ss", fzf.lsp_document_symbols, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>sS", fzf.lsp_workspace_symbols, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>sw", fzf.grep_cWORD, { desc = "Grep current word" })
			vim.keymap.set("n", "<leader>sR", fzf.resume, { desc = "Resume" })

			fzf.register_ui_select()
		end,
	},
}
