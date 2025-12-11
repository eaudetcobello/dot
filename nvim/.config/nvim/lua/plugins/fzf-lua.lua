return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local fzf = require("fzf-lua")

			fzf.setup({
				"ivy",
				files = {
					hidden = true,
				},
				grep = {
					rg_glob = true,
				},
				zoxide = {
					cmd = "zoxide query --list --score",
					formatter = "path.dirname_first",
					fzf_opts = {
						["--no-multi"] = true,
					},
				},
			})

			-- Files (f prefix)
			vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>fp", fzf.zoxide, { desc = "Projects" })

			-- Buffers (b prefix)
			vim.keymap.set("n", "<leader>bb", fzf.buffers, { desc = "Switch buffer" })
			vim.keymap.set("n", "<leader>,", fzf.buffers, { desc = "Switch buffer" })

			-- Search (s prefix)
			vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "Grep" })
			vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "Search word" })
			vim.keymap.set("n", "<leader>ss", fzf.lsp_document_symbols, { desc = "Document symbols" })
			vim.keymap.set("n", "<leader>sS", fzf.lsp_live_workspace_symbols, { desc = "Workspace symbols" })
			vim.keymap.set("n", "<leader>sR", fzf.resume, { desc = "Resume" })
			vim.keymap.set("n", "<leader>sd", fzf.diagnostics_workspace, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "Help tags" })
			vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Keymaps" })
		end,
	},
}
