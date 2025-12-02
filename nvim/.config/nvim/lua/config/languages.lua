-- Centralized language configuration
return {
	-- List of languages to enable for LSP, treesitter, and formatters
	-- Format: { filetype, lsp_server, formatters (optional) }
	{ "go", "gopls", { "goimports" } },
	{ "lua", "lua_ls", { "stylua" } },
	{ "terraform", "terraformls" },
	{ "yaml", "yamlls" },
	{ "sh", "bashls" },
	{ "json", "jsonls" },
	{ "html", "html" },
	{ "css", "cssls" },
}
