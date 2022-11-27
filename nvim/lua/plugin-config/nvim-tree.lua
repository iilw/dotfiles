local nvim_tree = require'nvim-tree'


local list_keys = require('keybindings').nvimTreeList

nvim_tree.setup({
  
  git = {
    enable = true,
  },

  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- 隐藏文件
  filters = {
    dotfiles = false,
    custom = {}
  },

  view = {
    width = 40,
    side = 'left',
    signcolumn = 'yes',
  },

  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true,
    }
  },

  system_open = {
    cmd = 'open'
  }

})
