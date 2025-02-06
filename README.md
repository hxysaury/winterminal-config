# 

terminal下载：
- [GitHub - microsoft/terminal: The new Windows Terminal and the original Windows console host, all in the same place!](https://github.com/microsoft/terminal)

powershell下载：

- [GitHub - PowerShell/PowerShell: PowerShell for every system!](https://github.com/PowerShell/PowerShell)

NerdFont下载：

- [Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/font-downloads)

starship下载：

- [GitHub - starship/starship: ☄🌌️ The minimal, blazing-fast, and infinitely customizable prompt for any shell!](https://github.com/starship/starship)

fastfetch下载：
- [Title Unavailable \| Site Unreachable](https://github.com/fastfetch-cli/fastfetch/)
- `scoop install fastfetch`

nushell下载

- `scoop install nu`

neovim下载：

- [https://github.com/neovim/neovim/blob/master/INSTALL.md](https://github.com/neovim/neovim/blob/master/INSTALL.md)

neovide下载：

- [https://neovide.dev/](https://neovide.dev/)

# 1. powershell设置



如果是win11的话会自带terminal，我是给卸载了，【设置->应用->安装的应用】


```lua
set-ExecutionPolicy RemoteSigned

# 安装Terminal-Icons
Install-Module -Name Terminal-Icons -Repository PSGallery

# 安装显示Git状态汇总信息
Install-Module posh-git -Scope CurrentUser

# 补全
Install-Module PSReadLine -Force

#文件搜索
Install-Module -Name PSFzf

# Directory jumper
Install-Module -Name z
```

编制配置文件：

```lua
notepad $PROFILE

# 添加如下内容：
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
## yazi  
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
```

#### 添加右键菜单

1. 打开注册表编辑器（`regedit`）。

2. 导航到以下路径：

   ```
   HKEY_CLASSES_ROOT\Directory\Background\shell
   ```

   这个路径用于添加右键菜单到文件夹背景。如果你想添加到文件夹本身，可以导航到：

   ```
   HKEY_CLASSES_ROOT\Directory\shell
   ```

3. 在 `shell` 键下，右键点击空白处，选择“新建” > “项”，命名为 `WindowsTerminal`（或者你想要的名称）。

4. 在新建的 `WindowsTerminal` 项中，右键点击空白处，选择“新建” > “项”，命名为 `command`。

5. 在 `command` 项中，双击右侧窗口中的 `(默认)` 值，输入以下内容：

   ```
   "C:\Apps\WindowsTerminal\WindowsTerminal.exe" --profile "默认配置文件名称" --new-tab -d "%V"
   ```

   - 将 `C:\Apps\WindowsTerminal\WindowsTerminal.exe` 替换为你的 Windows Terminal 的实际路径。
   - 如果你没有指定默认配置文件名称，可以省略 `--profile "默认配置文件名称"` 部分。
   - `-d "%V"` 表示在当前文件夹路径下打开终端。

6. 返回到 `WindowsTerminal` 项，双击右侧窗口中的 `(默认)` 值，输入你希望在右键菜单中显示的名称，例如 `在终端中打开`。

#### **添加图标（可选）**

如果你想为右键菜单项添加图标，可以进行以下操作：

1. 在 `WindowsTerminal` 项中，右键点击空白处，选择“新建” > “字符串值”，命名为 `Icon`。

2. 双击 `Icon`，输入 Windows Terminal 的图标路径，例如：

   ```
   "C:\Apps\WindowsTerminal\WindowsTerminal.exe,0"
   ```

   这里的 `,0` 表示使用该程序的第一个图标。

# 2. starship配置

```lua
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
```

路径：`~/.config/starship.toml`
starship 的所有配置都在此 [TOML](https://github.com/toml-lang/toml) 文件中完成

> 我这里保持默认就行，不做配置




# 3. yazi

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

# 4.nushell

路径：`nushell` 中执行 `echo $nu.config-path`

示例配置：

```lua
# 启动starship
use ~/.cache/starship/init.nu

# 删除欢迎语
$env.config.show_banner = false

$env.config.buffer_editor = "nvim"

# 定义别名和目录常量
alias vim = nvim

# 设置代理
# $env.HTTP_PROXY = ""
def --env "proxy set" [] {
    load-env { "HTTP_PROXY": "socks5://127.0.0.1:10808", "HTTPS_PROXY": "socks5://127.0.0.1:10808" }
}

proxy set

def --env "proxy unset" [] {
    load-env { "HTTP_PROXY": "", "HTTPS_PROXY": "" }
}

def "proxy check" [] {
    print "Try to connect to Google..."
    let resp = (curl -I -s --connect-timeout 2 -m 2 -w "%{http_code}" -o /dev/null www.google.com)
    
    if $resp == "200" {
        print "Proxy setup succeeded!"
    } else {
        print "Proxy setup failed!"
    }
}
```



# 5.neovim

配置文件的存放地址：`C:\Users\用户\AppData\Local\nvim`

Lazyvim项目地址：[GitHub - LazyVim/LazyVim: Neovim config for the lazy](https://github.com/LazyVim/LazyVim?tab=readme-ov-file)

Lazyvim安装文档：[Fetching Title#cmv7](http://www.lazyvim.org/installation)




## Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)

- Git >= **2.19.0** (for partial clones support)

- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **(optional, but needed to display some icons)**

- [lazygit](https://github.com/jesseduffield/lazygit) **(optional)**

- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)

- **curl** for [blink.cmp](https://github.com/Saghen/blink.cmp) **(completion engine)**

- for fzf-lua   *(optional)*

  - **fzf**: [fzf](https://github.com/junegunn/fzf) **(v0.25.1 or greater)**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)

- cmake

- make

- cargo

- MSBuild.exe  **(Microsoft Visula Studio\2022\Community\MSBuild\Current\Bin)**

- rust

- lua5.1

  - windows:

  - ```
    - luarocks.exe
    - lua.exe
    https://github.com/rjpcomputing/luaforwindows/releases
    ```

  - linux：

  - ```bash
    sudo apt-get install luarocks
    sudo apt-get install lua5.1
    ```

- node

  - npm
  
- [交叉编译链arm-none-eabi-gcc](https://launchpad.net/gcc-arm-embedded/+download)

- llvm-mingw

- python

  - ```
    pip install pyright
    ```

  - ```
    pip install isort
    ```

- go

  - ```
    go install mvdan.cc/gofumpt@latest
    ```

  - ```
    go install golang.org/x/tools/cmd/goimports@latest
    ```

- [neovide](https://github.com/neovide/neovide/releases)

- [image-nvim：ueberzugpp（适合linux）](https://github.com/jstkdng/ueberzugpp)

- ImageMagick

  - linux:

  - ```bash
    sudo apt-get install imagemagick
    ```

  - windows:

  - https://imagemagick.org/script/download.php




## Keymaps



### 文件树

| **键位**                          | **描述**            |
| --------------------------------- | ------------------- |
| **space e**                       | 打开/关闭目录树     |
| **r**                             | 文件/文件夹重命名   |
| **shift h**                       | 显示/隐藏，隐藏文件 |
| **Ctrl h**                        | 从编辑区跳回文件树  |
| **a**                             | 创建文件            |
| **d**                             | 删除文件            |
| **A**                             | 创建文件夹          |
| **space** or  **Enter**           | 展开文件夹          |
| 光标选中文件按**Enter**，进行编辑 |                     |
| 具体快捷键可以按`?`查看           |                     |





| **键位**       | **描述**             |
| -------------- | -------------------- |
| **ctrl-h**     | 跳至左侧窗口         |
| **ctrl-j**     | 跳至下方窗口         |
| **ctrl-k**     | 跳至上方窗口         |
| **ctrl-l**     | 跳至右侧窗口         |
| **ctrl-Up**    | 增加当前窗口高度     |
| **ctrl-Down**  | 减少当前窗口高度     |
| **ctrl-Left**  | 减少当前窗口宽度     |
| **ctrl-Right** | 增加当前窗口宽度     |
| **alt-j**      | 向下移动（移动某行） |
| **alt-k**      | 向上移动（移动某行） |

### 缓冲区

| **键位**    | **描述**           |
| ----------- | ------------------ |
| **shift-h** | 切换至上一个缓冲区 |
| **shift-l** | 切换至下一个缓冲区 |
| **[b**      | 切换至上一个缓冲区 |
| **]b**      | 切换至下一个缓冲区 |
| **space w** | 保存               |
| **space c** | 关闭               |
| **space v** | 关闭               |

### 终端

| **键位**     | **描述**                             |
| ------------ | ------------------------------------ |
| **space ft** | 打开终端(从根目录)                   |
| **space fT** | 打开终端(从当前工作目录)             |
| **ctrl-/**   | 关闭终端                             |
| **space wm** | 将当前终端最大化                     |
| **-**        | split  windows    Below              |
| **\|**       | split  windows   Right               |
| **space f**  | **ctrl +h\j\k\l 关闭**（Toggleterm） |
| **space h**  | **ctrl +h\j\k\l 关闭**（Toggleterm） |
| **space t**  | **ctrl +h\j\k\l 关闭**（Toggleterm） |
| **space v**  | **ctrl +h\j\k\l 关闭**（Toggleterm） |

### git

| **键位**     | **描述**        |
| ------------ | --------------- |
| **space gg** | 打开git GUI页面 |
| **space gG** |                 |
| **space gl** | git log         |
| **space gL** | git log         |
| **space gc** | commits         |
| **space gs** | status          |

### 数据库

| **键位**                   | **描述**                                                     |
| -------------------------- | ------------------------------------------------------------ |
| **space DD**               | 打开GUI页面                                                  |
| **space DA**               | 连接，例如：mysql://user:password@host:port/database         |
| **A**                      | 数据库用户界面中，使用`A`键添加新的数据库连接                |
| **space DF**               | 打开一个新的SQL查询窗口                                      |
| **space DT**               |                                                              |
| **o**或**\<cr>**（回车键） | 打开或关闭节点，可以浏览数据库中的表、视图等结构。           |
| **R**                      | 刷新当前节点                                                 |
| **space  W（默认为 \W）**  | 在SQL查询窗口中，使用`<leader>W`（默认为`\W`）保存当前查询到文件 |



### 查找

| **键位**     | **描述**       |
| ------------ | -------------- |
| **space fb** | find buffers   |
| **space fc** | find commands  |
| **space ff** | find files     |
| **space fF** | find all files |
| **space fw** | find words     |

### 跳转

| **键位**          | **描述**                             |
| ----------------- | ------------------------------------ |
| **space space a** | go to any char                       |
| **space space b** | go to previous any begining of words |
| **space space e** | go to next any end of words          |
| **space space h** |                                      |
| **space space j** | go to line below                     |
| **space space k** | go to line above                     |
| **space space l** |                                      |
| **space space v** | go to previous any end of words      |
| **space space m** | go to next any begining of words     |

### 程序运行



| **键位**     | **描述**        |
| ------------ | --------------- |
| **space rp** | 运行当前py程序  |
| **space rg** | 运行当前go程序  |
| **space rc** | Run cmake codes |
| **space ru** | Run cargo codes |
| **gd**       | 源代码查看      |
| **space cf** | Format          |

### Others

| **键位**          | **描述**                             |
| ----------------- | ------------------------------------ |
| **space space t** | 光标颜色切换                         |
| **space space z** | 当前编辑区高亮显示，其他区域灰色显示 |
| **space space e** | go to next any end of words          |
| **space :**       | 命令历史                             |
| **space n**       | 通知历史                             |
| **space cl**      | Lsp info                             |
| **space cm**      | Mason                                |
| **tt**            | 打开yazi 文件管理                    |
