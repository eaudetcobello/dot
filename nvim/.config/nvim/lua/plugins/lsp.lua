return {
	{
		"neovim/nvim-lspconfig",
		opts = {},
		config = function()
			vim.lsp.config["gopls"] = {
				staticcheck = true,
			}
			local lspgroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
			local map = vim.keymap.set
			vim.api.nvim_create_autocmd("LspAttach", {
				group = lspgroup,
				callback = function()
					local builtin = require("telescope.builtin")
					map("n", "gd", builtin.lsp_definitions, { desc = "Goto definitions" })
					map("n", "grr", builtin.lsp_references, { desc = "Goto references" })
					map("n", "gt", builtin.lsp_type_definitions, { desc = "Goto typedefs" })
					map("n", "gi", builtin.lsp_implementations, { desc = "Goto implementations" })
					map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
					map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

					vim.diagnostic.config({
						--severity_sort = true,
						signs = {
							text = {
								[vim.diagnostic.severity.ERROR] = "󰅙",
								[vim.diagnostic.severity.WARN] = "",
								[vim.diagnostic.severity.INFO] = "󰋼",
								[vim.diagnostic.severity.HINT] = "󰌵",
							},
						},
					})
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
		"mason-org/mason-lspconfig.nvim",
		opts = function()
			local languages = require("config.languages")
			local lsp_servers = {}
			for _, lang in ipairs(languages) do
				table.insert(lsp_servers, lang[2])
			end
			-- Add additional LSP servers not tied to a specific language
			table.insert(lsp_servers, "copilot")

			return {
				automatic_enable = true,
				ensure_installed = lsp_servers,
			}
		end,
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
