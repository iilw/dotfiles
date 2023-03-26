local status, theme = pcall(require, 'github-theme')
if (not status) then return end

theme.setup({
  theme_style = 'dark',
  dark_sidebar = false,
})
