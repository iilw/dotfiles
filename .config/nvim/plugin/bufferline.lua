require("vim-pack").add({
	{
		src = "akinsho/bufferline.nvim",
		opts = {
			options = {
				mode = "tabs",
				show_close_icon = false,
				show_buffer_close_icons = false,
				always_show_bufferline = false,
			},
		},
	},
})
