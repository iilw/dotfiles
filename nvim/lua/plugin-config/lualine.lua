require('lualine').setup {
  options = {
    theme = "tokyonight",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "[] ", right = "[]" },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { "[] ", "[] ", "[] ", "[] ", "[] ", "[] " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      "encoding",
      "filetype",
    },
  }
}
