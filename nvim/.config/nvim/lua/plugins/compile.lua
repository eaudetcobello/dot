return {
	"ej-shafran/compile-mode.nvim",
	branch = "nightly",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			input_word_completion = true,
			baleia_setup = true,
			bang_expansion = true,
		}

		vim.keymap.set("n", "<leader>cc", "<CMD>Compile<CR>", { silent = true })
		vim.keymap.set("n", "<leader>cC", "<CMD>Recompile<CR>", { silent = true })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "compilation",
			callback = function(ev)
				vim.wo.wrap = true
				vim.wo.number = false
			end,
		})
	end,
}
