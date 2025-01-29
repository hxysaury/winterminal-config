clear
# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
# 引入starship
Invoke-Expression (&starship init powershell)
Import-Module Terminal-Icons
Import-Module posh-git


# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
# install :Install-Module -Name PSFzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# # Env
# $env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"



# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

# Alias
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias vim nvim
Set-Alias nvim neovide
Set-Alias Cursor "C:\\Users\\Saury\\AppData\Local\\Programs\\cursor\\Cursor.exe"
Set-Alias Music "D:\\Program Files\\Soda Music\\SodaMusicLauncher.exe"
Set-Alias Chrome "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
Set-Alias Yakit "D:\\Program Files\\yakit\\Yakit\\Yakit.exe"

