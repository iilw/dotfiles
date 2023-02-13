local status, icons = pcall(require, 'web-devicons')
if (not status) then return end

icons.setup {
  override = {},
  color_icons = true,
  default = true
}
