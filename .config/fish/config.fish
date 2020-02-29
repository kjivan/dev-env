#!/usr/bin/env fish

if test -d /usr/local/sbin
    set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
end

if test -d /home/linuxbrew/.linuxbrew/bin
    set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
end
if test -d /home/linuxbrew/.linuxbrew/sbin
    set -gx PATH /home/linuxbrew/.linuxbrew/sbin $PATH
end
if test -d /usr/local/go/bin
    set -gx PATH $PATH /usr/local/go/bin
    set -gx GOPATH $HOME/go
end
if test -d $HOME/.cargo/bin
    set -gx PATH $PATH $HOME/.cargo/bin
end
if test -d $HOME/cg1v-dev-tools
    set -gx PATH $PATH $HOME/cg1v-dev-tools
end
if test -d $HOME/owf/apache-tomcat
    set -gx TOMCAT_DIR $HOME/owf/apache-tomcat
end
if test -d /usr/local/opt/mysql@5.5/bin
    set -gx PATH $PATH /usr/local/opt/mysql@5.5/bin
end
if test -d $HOME/.poetry/bin
    set -gx PATH $PATH $HOME/.poetry/bin
end

set -xg fish_greeting ""

set -xg VISUAL nvim
set -xg EDITOR $VISUAL
set -xg GIT_EDITOR $VISUAL

alias dg="/usr/bin/git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME"

alias reload="source $HOME/.config/fish/config.fish"
alias edit="vi $HOME/.config/fish/config.fish"

if type -q sk
  set -xg SKIM_DEFAULT_OPTIONS '--ansi --color="fg:#458588,bg:#1d2021,hl:#98971a,fg+:#458588,hl+:#cc241d,info:#b16286"'
end

if type -q fd
    alias fd='fd --hidden'
    alias fda='fd --no-ignore'

    if type -q sk
        set -xg SKIM_DEFAULT_COMMAND "fd"

        alias c='cd (fd --type d | sk)'
        alias ch='cd (fd --type d --search-path $HOME | sk)'
        alias v='vi (fd | sk)'
        alias vh='vi (fd --search-path $HOME | sk)'
        alias ska='fda | sk'
    end
end

if type -q rg
    alias rg='rg --hidden'
    alias rga='rg --no-ignore'
    alias rgi='sk --ansi -i -c \'rg --color=always --line-number "{}"\''
end

if type -q nvim
    alias vim=nvim
    alias vi=nvim
end

if type -q exa
    alias l='exa --oneline'
    alias ls='exa --oneline'
    alias ll='exa --long'
    alias lt='exa --tree'
end

alias grep='command grep --color=auto'

if type -q bat
    alias cat='bat -p'
    alias b='bat -p'
end

if type -q ccze
    function ca
        command cat $argv | ccze -A
    end
    function t
        command tail $argv | ccze -A
    end
    function tf
        command tail -f $argv | ccze -A
    end
end

if type -q colordiff
    alias diff='colordiff --ignore-space-change'
else
    alias diff='diff --color --ignore-space-change'
end

if type -q autossh
    function ssh
        command autossh -M 0 $argv
    end
end

alias g='git'
alias gs='git status --short --branch'
alias gst='git stash'
alias gco='git checkout'
alias gcop='git checkout --patch'
alias gr='git reset'
alias ga='git add'
alias gap='git add --patch'
alias gai='git add --interactive '
alias grb='git rebase'
alias grbi='git rebase --interactive'
alias gc='git commit'
alias gb='git branch'
alias gpl='git pull'
alias gup='git stash; git pull; git stash pop'
alias gps='git push'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --abbrev-commit --pretty=oneline'
alias gg='git log --graph --decorate --oneline --simplify-by-decoration'
alias gfg='git log --all --graph --decorate --oneline --simplify-by-decoration'
alias gga='git log --graph --oneline --decorate --all'
alias gbr="git branch | grep -v "Development" | xargs git branch -D"

alias nrs='npm run start'
alias nrb='npm run build'
alias nrt='npm run test'
alias nrth='npm run test-headless'
alias nrl='npm run lint'
alias nre='npm run e2e'

alias grcb='./gradlew clean build'
alias grcbp='./gradlew clean build publishToMavenLocal'
alias grcbr='./gradlew clean bootrun'

[ -f /home/linuxbrew/.linuxbrew/share/autojump/autojump.fish ]; and source /home/linuxbrew/.linuxbrew/share/autojump/autojump.fish
