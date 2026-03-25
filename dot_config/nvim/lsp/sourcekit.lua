
--- @type vim.lsp.Config
return {
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift" },
  root_markers = {
    ".git",
    ".sourcekit-lsp",
    "Package.swift"
  },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true
      }
    },
    textDocument = {
      diagnostic = {
        dynamicRegistration = true,
        relatedDocumentSupport = true
      }
    }
  }
}
