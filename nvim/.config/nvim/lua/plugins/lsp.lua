return {
	{
		"neovim/nvim-lspconfig",
		opts = {},
		config = function()
			vim.lsp.config["gopls"] = {
				settings = {
					gopls = {
						staticcheck = true,
					},
				},
			}
			local lspgroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
			local map = vim.keymap.set
			vim.api.nvim_create_autocmd("LspAttach", {
				group = lspgroup,
				callback = function()
					local fzf = require("fzf-lua")
					map("n", "gd", fzf.lsp_definitions, { desc = "Goto definitions" })
					map("n", "grr", fzf.lsp_references, { desc = "Goto references" })
					map("n", "gt", fzf.lsp_typedefs, { desc = "Goto typedefs" })
					map("n", "gi", fzf.lsp_implementations, { desc = "Goto implementations" })
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

            -- Remove Lua for now as the version provided by Mason has a bug.
            -- Use the system lua-language-server installed with brew instead.
            -- github.com/LuaLS/lua-language-server/issues/3301
            -- lsp_servers["lua_ls"] = nil

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
