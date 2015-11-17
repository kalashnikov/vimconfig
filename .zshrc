# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

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

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin"
# export MANPATH="/usr/local/man:$MANPATH"

#export PATH=$PATH:$ANDROID_HOME/platform-tools:/Users/kalaexj/bin/gradle/bin
#export ANDROID_HOME=/Users/kalaexj/Documents/android-sdk/

export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/bin/lib
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/bin/lib

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

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Align with .tmux.conf
# Tmux is relatively picky about having a terminal set correctly. 
# If you can, set the term value in gnome-terminal's configuration, not in your .bashrc. 
# Failing that, surround those settings with a check for "screen" or "screen-256color" TERM, and don't reset them in that case.
# http://superuser.com/questions/399296/256-color-support-for-vim-background-in-tmux
export TERM="screen-256color"

export CSCOPE_DB="cscope.out"

# For rbenv
#eval "$(rbenv init -)"
#export RBENV_VERSION="2.2.2"

export DEFAULT_USER="KalaKuo"

export GOPATH=$HOME/github/algoPrac/go/
export GOROOT=/usr/local/go/
export GOMAXPROCS=4

#export PATH=$HOME/torch/install/bin:$HOME/.rvm/gems/ruby-2.2.2/bin:$GOPATH/bin/$PATH:$HOME/anaconda/bin
#export LD_LIBRARY_PATH=$HOME/torch/install/lib:$LD_LIBRARY_PATH 
#export DYLD_LIBRARY_PATH=$HOME/torch/install/lib:$DYLD_LIBRARY_PATH 

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#rvm use 2.2.2
#export HOSTNAME="KalaKuo"

export CLICOLOR=1

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# ============
# fzf exmaple 
# https://github.com/junegunn/fzf/wiki/examples
# ============

export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

