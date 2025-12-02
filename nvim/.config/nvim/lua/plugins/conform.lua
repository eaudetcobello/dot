return {
	{
		"stevearc/conform.nvim",
		event = "LspAttach",
		opts = function()
			local languages = require("config.languages")
			local formatters_by_ft = {}
			for _, lang in ipairs(languages) do
				if lang[3] then
					formatters_by_ft[lang[1]] = lang[3]
				end
			end

			return {
				default_format_opts = {
					timeout_ms = 3000,
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = formatters_by_ft,
			}
		end,
	},
}
