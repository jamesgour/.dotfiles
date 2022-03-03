# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jamesgou/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jamesgou/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jamesgou/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jamesgou/.fzf/shell/key-bindings.zsh"
