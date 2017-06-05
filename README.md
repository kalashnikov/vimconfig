## Kala Kuo's Config Repository

---

### zsh
- Install `oh-my-zsh`.
  + `sh -c "$(curl -fsSL
  https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

---

### Tmux
- Install `Tmux Plugin Manager`
  + `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

---

### Vim 
- Download the `vimplug` file.
  + `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- `:PlugInstall` to install the packages.

---

### Neovim 
- [Building Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim)
  + [Compile CMake with SSL support](https://github.com/neovim/neovim/issues/1469#issuecomment-63058312), [Ref2](http://stackoverflow.com/questions/29816529/unsupported-protocol-while-downlod-tar-gz-package)
  + [Prefix issue](https://github.com/neovim/neovim/issues/2111)
  + `make CMAKE_EXTRA_FLAGS=-DCMAKE_INSTALL_PREFIX=/path/ CMAKE_BUILD_TYPE=Release`
- [Nvim from Vim](https://neovim.io/doc/user/nvim_from_vim.html)
- [Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim), need `python3` support.
- [**24-Color**](https://gist.github.com/XVilka/8346728)
  + [Neovim](https://github.com/mobile-shell/mosh/issues/649) does not support so far. 
  + [tmux](http://sunaku.github.io/tmux-24bit-color.html#usage) is support recently. 

---

### Fonts for `powerline`
- `cp -rf .font* ~/`
- For OSX, copy `*.otf` to `/Library/Fonts/`

---

### iTerm2 Setting
- iTerm -> Preferences -> Profiles -> Colors -> load presets -> Import
- Fonts recommend: 
  + `Droid Sans Mono for Powerline`, size: 14+
  + `FantasqueSansMono`, size: 16+, used with [gruvbox](https://github.com/morhetz/gruvbox) theme 
- Hotkey: 
  + `Command+;`: F11 `^[[23~` (Not `^[[23;2~`) 
  + `Command+'`: F12 `^[[24~` (Not `^[[24;2~`) 

---
