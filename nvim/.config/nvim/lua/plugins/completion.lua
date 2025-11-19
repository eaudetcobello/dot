return {
	{
		"saghen/blink.cmp",
		tag = "v1.7.0",
		event = "InsertEnter",
		config = function()
			require("blink.cmp").setup({
				fuzzy = { implementation = "prefer_rust" },
				keymap = {
					preset = "enter",
				},
				signature = { enabled = true },
				completion = {
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 500,
					},
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				sources = {
					default = { "lazydev", "lsp", "buffer" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},
			})
		end,
	},
}
