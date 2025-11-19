return {
	{
		"stevearc/conform.nvim",
		event = "LspAttach",
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" },
			},
		},
	},
}
