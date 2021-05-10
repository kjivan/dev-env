if [[ $- == *i* ]]; then
    if [[ -x "/usr/local/bin/zsh" ]]; then
        exec /usr/local/bin/zsh
    fi

    if [[ -x "/usr/local/bin/fish" ]]; then
        exec /usr/local/bin/fish
    fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source "$HOME/.cargo/env"
