## Kala Kuo's Config Repository

### Prepare installation in Ubuntu
- Install
  + `sudo apt-get install zsh nginx git mosh vim tmux`
- Tutorial for Wordpress 
  + [LEMP Stack](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04)
  + [Install Wordpress for LEMP](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-on-ubuntu-16-04)

---

### SSH
- Add ssh key for login
  + Add (local) `~/.ssh/id_rsa` to (remote) `/home/(user)/.ssh/authorized_keys`

---

### zsh
- Install `starship`
  + `curl -sS https://starship.rs/install.sh | sh`
- Install Powerline theme
  + `starship preset pastel-powerline -o ~/.config/starship.toml`

---

### Tmux
- Install `Tmux Plugin Manager`
  + `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

---

### Vim 
- Download the `vimplug` file.
  + `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- For Neovim
  + New `.vimrc` location
    `mkdir -p ~/.config/nvim
     echo 'source ~/.nvimrc' > ~/.config/nvim/init.vim`
  + PlugIstall
    `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs " 
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"`
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
  + [Mosh](https://github.com/mobile-shell/mosh/issues/649) is support recently!! 
  + [tmux](http://sunaku.github.io/tmux-24bit-color.html#usage) is supported. 

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
