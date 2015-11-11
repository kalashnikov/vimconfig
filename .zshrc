# Path to your oh-my-zsh configuration.
ZSH=/Users/kalaexj/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/kalaexj/bin"
# export MANPATH="/usr/local/man:$MANPATH"

export PATH=$PATH:$ANDROID_HOME/platform-tools:/Users/kalaexj/bin/gradle/bin
export ANDROID_HOME=/Users/kalaexj/Documents/android-sdk/

export C_INCLUDE_PATH=$C_INCLUDE_PATH:/Users/kalaexj/bin/lib
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/Users/kalaexj/bin/lib

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source ~/.alias

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export CSCOPE_DB="cscope.out"

# For rbenv
eval "$(rbenv init -)"
export RBENV_VERSION="2.2.2"

export DEFAULT_USER="KalaKuo"

export GOPATH=$HOME/github/algoPrac/go/
export GOROOT=/usr/local/go/
export GOMAXPROCS=4

export PATH=/Users/kalaexj/torch/install/bin:/Users/kalaexj/.rvm/gems/ruby-2.2.2/bin:$GOPATH/bin/$PATH:$HOME/anaconda/bin
export LD_LIBRARY_PATH=/Users/kalaexj/torch/install/lib:$LD_LIBRARY_PATH 
export DYLD_LIBRARY_PATH=/Users/kalaexj/torch/install/lib:$DYLD_LIBRARY_PATH 

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

rvm use 2.2.2

export HOSTNAME="KalaKuo"

export CLICOLOR=1

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# fzf exmaple 
#

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# cdf - cd into the directory of the selected file
cdf() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# Setup cdg function
# ------------------
unalias cdg 2> /dev/null
cdg() {
  local dest_dir=$(cdscuts_glob_echo | fzf )
  if [[ $dest_dir != '' ]]; then
    cd "$dest_dir"
  fi
}
export -f cdg > /dev/null
