
#===========================================================================#
# ZSH setting 

# Path to your oh-my-zsh configuration.
ZSH=/Users/kalaexj/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="yellow"

zsh_wifi_signal(){
	local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I) 
	local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

	if [ "$airport" = "Off" ]; then
		local color='%F{yellow}'
		echo -n "%{$color%}Wifi Off"
	else
		local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
		local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
		local color='%F{yellow}'

		[[ $speed -gt 100 ]] && color='%F{green}'
		[[ $speed -lt 50 ]] && color='%F{red}'

		echo -n "%{$color%}$ssid $speed Mb/s%{%f%}" # removed char not in my PowerLine font 
	fi
}

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_wifi_signal ram time os_icon)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#===========================================================================#

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/kalaexj/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
export PATH="/usr/local/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH=/Users/kalaexj/torch/install/bin:$GOPATH/bin/$PATH:$HOME/anaconda/bin:/Users/kalaexj/.rvm/gems/ruby-2.2.2/bin:/usr/local/opt/go/libexec/bin

export PATH=$PATH:$ANDROID_HOME/platform-tools:/Users/kalaexj/bin/gradle/bin
export ANDROID_HOME=/Users/kalaexj/Documents/android-sdk/

export C_INCLUDE_PATH=$C_INCLUDE_PATH:/Users/kalaexj/bin/lib
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/Users/kalaexj/bin/lib

export GTEST_DIR=$HOME/github/googletest/googletest

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#===========================================================================#

source ~/.alias

export CSCOPE_DB="cscope.out"
export CLICOLOR=1
export TERM="screen-256color"
export LC_CTYPE=en_US.UTF-8

#===========================================================================#

# Ruby 
eval "$(rbenv init -)"
export RBENV_VERSION="2.2.2"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#rvm use 2.2.2

#===========================================================================#

export GOPATH=$HOME/github/algoPrac/go/
export GOROOT=/usr/local/Cellar/go/1.8.1/libexec/
export GOMAXPROCS=4

#===========================================================================#

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

#===========================================================================#

# fzf exmaple 
# https://github.com/junegunn/fzf/wiki/examples
export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#===========================================================================#

# Rust
export RUST_SRC_PATH="/Users/kalaexj/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
source $HOME/.cargo/env

#===========================================================================#
