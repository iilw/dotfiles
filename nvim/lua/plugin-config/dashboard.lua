vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer ={ "Ling" }

vim.g.dashboard_custom_section = {
  a = { description = { "  Projects              " }, command = "Telescope projects" },
  b = { description = { "  Recently files        " }, command = "Telescope oldfiles" },
  c = { description = { "  Edit keybindings      " }, command = "edit ~/.config/nvim/lua/keybindings.lua" },
  d = { description = { "  Edit Projects         " }, command = "edit ~/.local/share/nvim/project_nvim/project_history" },
}

vim.g.dashboard_custom_header = {
[[ .----------------.  .----------------.  .-----------------. .----------------. ]],
[[| .--------------. || .--------------. || .--------------. || .--------------. |]],
[[| |   _____      | || |     _____    | || | ____  _____  | || |    ______    | |]],
[[| |  |_   _|     | || |    |_   _|   | || ||_   \|_   _| | || |  .' ___  |   | |]],
[[| |    | |       | || |      | |     | || |  |   \ | |   | || | / .'   \_|   | |]],
[[| |    | |   _   | || |      | |     | || |  | |\ \| |   | || | | |    ____  | |]],
[[| |   _| |__/ |  | || |     _| |_    | || | _| |_\   |_  | || | \ `.___]  _| | |]],
[[| |  |________|  | || |    |_____|   | || ||_____|\____| | || |  `._____.'   | |]],
[[| |              | || |              | || |              | || |              | |]],
[[| '--------------' || '--------------' || '--------------' || '--------------' |]],
[[ '----------------'  '----------------'  '----------------'  '----------------' ]],
 
}
