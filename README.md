# WindowsTerminal+starship+yazi

## 1. 下载

terminal下载：
- [GitHub - microsoft/terminal: The new Windows Terminal and the original Windows console host, all in the same place!](https://github.com/microsoft/terminal)
powershell下载：
- [GitHub - PowerShell/PowerShell: PowerShell for every system!](https://github.com/PowerShell/PowerShell)
NerdFont下载：
- [Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/font-downloads)
starship下载：
- [GitHub - starship/starship: ☄🌌️ The minimal, blazing-fast, and infinitely customizable prompt for any shell!](https://github.com/starship/starship)


## 2. powershell设置


```lua
set-ExecutionPolicy RemoteSigned

# 安装Terminal-Icons
Install-Module -Name Terminal-Icons -Repository PSGallery

# 安装显示Git状态汇总信息
Install-Module posh-git -Scope CurrentUser

# 补全
Install-Module PSReadLine -Force
```

编制配置文件：

```lua
notepad $PROFILE

# 添加如下内容：
clear
# 引入starship
Invoke-Expression (&starship init powershell)

Import-Module Terminal-Icons
Import-Module posh-git 

# 设置别名

Set-Alias -Name ll -Value Get-ChildItem
```

## 3. starship配置

```lua
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
```

路径：`~/.config/starship.toml`
starship 的所有配置都在此 [TOML](https://github.com/toml-lang/toml) 文件中完成

> 我这里保持默认就行，不做配置




## 4. yazi

[installation|Yazi](https://yazi-rs.github.io/docs/installation)


在powershell配置文件中加入如下内容：
```bash
function y {  
$tmp = [System.IO.Path]::GetTempFileName()  
yazi $args --cwd-file="$tmp"  
$cwd = Get-Content -Path $tmp -Encoding UTF8  
if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {  
Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))  
}  
Remove-Item -Path $tmp  
}
```
然后就可以使用`y`而不是`yazi`来启动，并按 退出q，
