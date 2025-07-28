return {
	{
		"yetone/avante.nvim",
		build = "make",
		event = "VeryLazy",
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			provider = "deepseek",
			providers = {
				deepseek = {
					__inherited_from = "openai",
					api_key_name = "DEEPSEEK_API_KEY",
					endpoint = "https://api.deepseek.com",
					model = "deepseek-coder",
					max_tokens = 4096,
				},
				qianwen = {
					__inherited_from = "openai",
					api_key_name = "DASHSCOPE_API_KEY",
					endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
					model = "qwen-coder-plus-latest",
				},
			},
		},
	},
}
