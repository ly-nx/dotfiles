# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lynx/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/lynx/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lynx/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/lynx/.fzf/shell/key-bindings.bash"
