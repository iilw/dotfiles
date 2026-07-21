--- @type vim.lsp.Config
return {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift" },
	root_markers = {
		".sourcekit-lsp",
		".xcworkspace",
		".xcodeproj",
		"Package.swift",
		".git",
	},
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
		textDocument = {
			diagnostic = {
				dynamicRegistration = true,
				relatedDocumentSupport = true,
			},
		},
	},
}
