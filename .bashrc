if [[ $- == *i* ]]; then
    if [[ -x "/usr/local/bin/fish" ]]; then
        exec /usr/local/bin/fish
    fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
