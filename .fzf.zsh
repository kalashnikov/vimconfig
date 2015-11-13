# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/kalaexj/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/kalaexj/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/kalaexj/.fzf/man* && -d "/Users/kalaexj/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/kalaexj/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/kalaexj/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/kalaexj/.fzf/shell/key-bindings.zsh"


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

# ---------------------------------------------------------
# Bookmark based on fzf
if [[ -z $BOOKMARKS_FILE ]] ; then
    export BOOKMARKS_FILE="$HOME/.bookmarks"
fi

if [[ ! -f $BOOKMARKS_FILE ]]; then
    touch $BOOKMARKS_FILE
fi

function mark() {
    echo $1 : $(pwd) >> $BOOKMARKS_FILE
}

fzfcmd() {
   [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}

function jump() {
    jumpline=$(cat ${BOOKMARKS_FILE} | $(fzfcmd) --bind=ctrl-y:accept --tac)
    if [[ -n ${jumpline} ]]; then
        jumpdir=$(echo $jumpline | awk '{print $3}')
        sed -i --follow-symlinks "\#${jumpline}#d" $BOOKMARKS_FILE
        cd ${jumpdir} && echo ${jumpline} >> $BOOKMARKS_FILE
    fi
    zle && zle reset-prompt
}

function dmark()  {
    marks_to_delete=$(cat $BOOKMARKS_FILE | $(fzfcmd) -m --bind=ctrl-y:accept,ctrl-t:toggle-up --tac)

    if [[ -n ${marks_to_delete} ]]; then
        while read -r line; do
            sed -i --follow-symlinks "\#${line}#d" $BOOKMARKS_FILE
        done <<< "$marks_to_delete"

        echo "** The following marks were deleted **"
        echo ${marks_to_delete}
    fi
}

zle -N jump
bindkey '^g' jump
alias j="jump"
