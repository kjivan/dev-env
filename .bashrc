if [[ $- == *i* ]]; then
    if [[ -x "/usr/local/bin/fish" ]]; then
        exec /usr/local/bin/fish
    fi
    if [[ -x "/home/linuxbrew/.linuxbrew/bin/fish" ]]; then
        exec /home/linuxbrew/.linuxbrew/bin/fish
    fi
    if [[ -x "$HOME/go/bin/elvish" ]]; then
        exec $HOME/go/bin/elvish
    fi
    if [[ -x "/home/linuxbrew/.linuxbrew/bin/elvish" ]]; then
        exec /home/linuxbrew/.linuxbrew/bin/elvish
    fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source "$HOME/.cargo/env"
