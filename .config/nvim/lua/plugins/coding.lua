return {

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- im-select
  {
    "keaising/im-select.nvim",
    config = function(_, opts)
      require("im_select").setup(opts)
    end,
  },
}
