# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.zsh/sk-completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.zsh/sk-key-bindings.zsh"
