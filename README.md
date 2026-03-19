# Requirements
## Global(There is a chance that not all of these are in fact needed)
- git
- make
- gcc
- ripgrep
- some nerdfont
- npm
- python
- go
- rust

## Any Linux
- some clipboard tool, eg. wl-clipboard
- unzip

## NixOS Specific(you need to handle lsps/formatters etc. yourself)
- clangd
- pyrefly
- lua_ls
- clang-format
- ruff
- stylua

# Installation
<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/shv187/neovim_config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/shv187/nvim_config.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone https://github.com/shv187/nvim_config.git "${env:LOCALAPPDATA}\nvim"
```

</details>
