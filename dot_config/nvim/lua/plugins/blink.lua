return {
	{
		"saghen/blink.cmp",
		dependencies = "LuaSnip",
		build = "cargo +nightly build --release",
		event = { "InsertEnter", "CmdLineEnter" },
		---@module 'blink-cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
			snippets = { preset = "luasnip" },
			cmdline = { enabled = false },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				list = {
					selection = { preselect = false },
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				menu = {
					scrollbar = false,
					draw = {
						gap = 2,
						columns = {
							{ "kind_icon" },
							{ "label", "kind", "label_description", gap = 1 },
						},
						components = {
							kind = {
								text = function(ctx)
									if ctx.label_description ~= nil and ctx.label_description ~= "" then
										return nil
									end
									return ctx.kind
								end,
							},
						},
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
}
