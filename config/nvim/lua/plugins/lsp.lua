local keymaps = {
	{ key = "gd", cmd = "<cmd>lua vim.lsp.buf.definition()<cr>" },
	{ key = "K", cmd = "<cmd>lua vim.lsp.buf.hover()<cr>" },
	{ key = "[e", cmd = "<cmd>lua vim.diagnostic.goto_prev()<cr>" },
	{ key = "]e", cmd = "<cmd>lua vim.diagnostic.goto_next()<cr>" },
}

return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		dependencies = {
			{ "saghen/blink.cmp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		opts = {
			diagnostics = {},
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
						},
					},
				},
			},
			setup = {},
		},
		config = function(_, opts)
			local servers = opts.servers

			local lsp = require("lspconfig")
			local mlsp = require("mason-lspconfig")
			local blink = require("blink.cmp")

			local capabilities = blink.get_lsp_capabilities()
			local all_mlsp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

			-- setup keymaps
			local function setup_keymaps(bufnr)
				for _, map in ipairs(keymaps) do
					vim.api.nvim_buf_set_keymap(bufnr, "n", map.key, map.cmd, { noremap = true, silent = true })
				end
			end

			local ensure_installed = {}
			for server, _ in pairs(servers) do
				if vim.tbl_contains(all_mlsp_servers, server) then
					ensure_installed[#ensure_installed + 1] = server
				end
			end

			local setup = function(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
					on_attach = function(_, buffer)
						setup_keymaps(buffer)
					end,
				}, servers[server] or {})
				lsp[server].setup(server_opts)
			end

			mlsp.setup({
				automatic_installation = true,
				ensure_installed = ensure_installed,
				handlers = { setup },
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {},
		},
		config = function(_, opts)
			require("mason").setup(opts)

			local mr = require("mason-registry")

			mr:on("package.install:success", function()
				vim.defer_fn(function()
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)

			mr.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					vim.notify(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
	},
}
