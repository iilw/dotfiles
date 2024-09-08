# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Fnm for node manager
fnm env --use-on-cd --shell power-shell | Out-String | Invoke-Expression

# Functions
function ls { exa --icons=auto $args}
function ll { exa -l --icons=auto $args }

# Alias
Set-Alias g git
Set-Alias vim nvim




