return {
	{
		"neovim/nvim-lspconfig",
		opts = {},
		config = function()
			vim.g.zig_fmt_parse_errors = 0
			vim.lsp.enable({
				"gopls",
				"lua_ls",
				"zls",
				"rust_analyzer",
				"copilot",
				"terraformls",
			})
			vim.lsp.config["gopls"] = {
				staticcheck = true,
			}
			vim.lsp.config["zls"] = {
				semantic_tokens = "partial",
			}
			local lspgroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
			local map = vim.keymap.set
			vim.api.nvim_create_autocmd("LspAttach", {
				group = lspgroup,
				callback = function()
					local fzf = require("fzf-lua")
					map("n", "gd", fzf.lsp_definitions, { desc = "Goto definitions" })
					map("n", "gr", fzf.lsp_references, { desc = "Goto references" })
					map("n", "gt", fzf.lsp_typedefs, { desc = "Goto typedefs" })
					map("n", "gi", fzf.lsp_implementations, { desc = "Goto implementations" })
					map("n", "<leader>ca", fzf.lsp_code_actions, { desc = "Code actions" })
					map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
				end,
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		cmd = "LazyDev",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "LazyVim", words = { "LazyVim" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},
	{
		"https://github.com/ziglang/zig.vim",
	},
}
