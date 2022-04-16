require('telescope').setup = {
  defaults = {
    -- 打开弹窗后进入的初始模式
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 查找文件换皮肤, 支持的参数有：dropdown, cursor, ivy
      -- theme = "dropdown",
    }
  },
  extensions = {
    -- 扩展插件配置
  }
}
