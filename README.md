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

### Rust
- `sudo apt install build-essential`
- `curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh`

--- 

### Zerotier
- Command
  + `curl -s https://install.zerotier.com | sudo bash`
  + `sudo zerotier-cli join xxx`

---

### Docker
- [Official](https://docs.docker.com/engine/install/ubuntu/)
- Commands
```sh
sudo apt-get -y install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker

newgrp docker
```
- Watchtower
```sh
docker run -d --restart=always \
--name watchtower \
-v /var/run/docker.sock:/var/run/docker.sock \
containrrr/watchtower \
--cleanup
```

---

### Minio Client
- [Official](https://min.io/docs/minio/linux/reference/minio-mc.html)
```sh
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/minio-binaries/mc

chmod +x $HOME/minio-binaries/mc
export PATH=$PATH:$HOME/minio-binaries/

mc --help
```

---

### BBR optimization
- [Use BBR to Improve the Connection With VPS](https://big533.cc/wordpress/index.php/2019/12/28/use-bbr-to-improve-the-connection-with-vps/)
```sh
# add kernel module
sudo modprobe tcp_bbr

# Configure kernel modules to load at boot
echo "tcp_bbr" | sudo tee --append /etc/modules-load.d/modules.conf

# Configure sysctl preload/configuration file
echo "net.core.default_qdisc=fq" | sudo tee --append /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee --append /etc/sysctl.conf

# configure default kernel parameters
sudo sysctl -p
```

---

### Vim 
- Download the `vimplug` file.
  + `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
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

## Software 
- [Battery](https://github.com/actuallymentor/battery)
- [Hidden Bar](https://apps.apple.com/tw/app/hidden-bar/id1452453066?mt=12)
- [Say no to notch](https://apps.apple.com/us/app/say-no-to-notch/id1639306886?mt=12)

