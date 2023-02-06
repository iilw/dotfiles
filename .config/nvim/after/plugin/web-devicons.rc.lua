local status, icons = pcall(require, 'web-devicons')
if (not status) then return end

icons.setup {
  override = {},
  default = true
}
