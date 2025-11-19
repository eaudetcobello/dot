return {
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
}
