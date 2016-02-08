Kala Kuo's Config Repository

---

### zsh
- Install `oh-my-zsh`.
  + `sh -c "$(curl -fsSL
  https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

---

### Vim 
- Download the `vimplug` file.
  + `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- `:PlugInstall` to install the packages.

---

### Fonts for `powerline`
- `cp -rf .font* ~/`
- For OSX, copy `*.otf` to `/Library/Fonts/`

---

### iTerm2 Setting
- `wget https://raw.github.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors`
- iTerm -> Preferences -> Profiles -> Colors -> load presets -> Import
- Fonts recommend: `Droid Sans Mono for Powerline`, size: 14 or 18 
- Hotkey: 
  + `Command+;`: F11 `^[[23~` (Not `^[[23;2~`) 
  + `Command+'`: F12 `^[[24~` (Not `^[[24;2~`) 

---
