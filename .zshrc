[ -d /usr/local/sbin ] && export PATH="/usr/local/sbin:$PATH"
[ -d /home/linuxbrew/.linuxbrew/bin ] && export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
[ -d /home/linuxbrew/.linuxbrew/sbin ] && export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
[ -d $HOME/go/bin ] && export PATH="$PATH:$HOME/go/bin" && export "GOPATH:$HOME/go"
[ -d $HOME/.cargo/bin ] && export PATH="$PATH:$HOME/.cargo/bin"
[ -d $HOME/.poetry/bin ] && export PATH="$PATH:$HOME/.poetry/bin"
[ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export VISUAL=nvim
export EDITOR $VISUAL
export GIT_EDITOR $VISUAL

# dev-env git
alias dg="git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME"

# zshrc editing
alias reload="source $HOME/.zshrc"
alias edit="vi $HOME/.zshrc"

if type "sk" > /dev/null; then
   export SKIM_DEFAULT_OPTIONS='--ansi --color="fg:#458588,bg:#1d2021,hl:#98971a,fg+:#458588,hl+:#cc241d,info:#b16286"'
   alias fzf='sk'
fi

# fd - find replacement
if type "fd" > /dev/null; then
    alias fdh='fd --hidden'
    alias fda='fdh --no-ignore'

    if type "sk" > /dev/null; then
        export SKIM_DEFAULT_COMMAND="fd"

        alias c='cd (fd --type d | sk)'
        alias ch='cd (fd --type d --search-path $HOME | sk)'
        alias v='vi (fd | sk)'
        alias vh='vi (fd --search-path $HOME | sk)'
        alias ska='fda | sk'
    fi
fi

setopt share_history

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
