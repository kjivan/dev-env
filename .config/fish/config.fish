#!/usr/bin/env fish

if test -d /usr/local/sbin
    set -g PATH "/usr/local/sbin" $PATH
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
if test -d $HOME/.poetry/bin
    set -gx PATH $PATH $HOME/.poetry/bin
end
if test -d $HOME/bin
    set -gx PATH $PATH $HOME/bin
end

if test -f $HOME/.local.fish
     source $HOME/.local.fish
end

set -xg fish_greeting ""

set -xg VISUAL nvim
set -xg EDITOR $VISUAL
set -xg GIT_EDITOR $VISUAL

# dev-env git
alias dg="git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME"

# fish editing
alias reload="source $HOME/.config/fish/config.fish"
alias edit="vi $HOME/.config/fish/config.fish"

# ctrl-s for sudo
bind \cs runsudo

# sk - fast fuzzy finder
if type -q sk
  set -xg SKIM_DEFAULT_OPTIONS '--ansi --color="fg:#458588,bg:#1d2021,hl:#98971a,fg+:#458588,hl+:#cc241d,info:#b16286"'
  alias fzf='sk'
end

# fd - find replacement
if type -q fd
    alias fdh='fd --hidden'
    alias fda='fdh --no-ignore'

    if type -q sk
        set -xg SKIM_DEFAULT_COMMAND "fd"

        alias c='cd (fd --type d | sk)'
        alias ch='cd (fd --type d --search-path $HOME | sk)'
        alias v='vi (fd | sk)'
        alias vh='vi (fd --search-path $HOME | sk)'
        alias ska='fda | sk'
    end
end

# rg - grep replacement
if type -q rg
    alias rgh='rg --hidden'
    alias rga='rg --no-ignore'
    alias rgi='sk --ansi -i -c \'rg --color=always --line-number "{}"\''
end

if type -q nvim
    alias vim=nvim
    alias vi=nvim
end

if type -q exa
    alias ls='exa --grid  --color auto --sort type'
    alias lsa='exa --grid  --color auto --all --sort type'
    alias ll='exa --long --color always --sort type'
    alias lla='exa --grid  --color auto --all --sort type'

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

function create-min-snow
  yarn create snowpack-app $argv --template @snowpack/app-template-minimal --use-yarn
end

alias serve-http='python -m SimpleHTTPServer 8000'
alias serve-http3='python3 -m http.server 8000 --bind 127.0.0.1'

# Network Debugging
function get-port-app
    command lsof -nP -iTCP:$argv | grep LISTEN
end

# Git
alias g='git'
alias gs='git status --short --branch'
alias gst='git stash'
alias gf='git fetch'
alias gco='git checkout'
alias gcop='git checkout --patch'
alias gr='git reset'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias grs='git reset --soft'
alias grsh='git reset --soft HEAD'
alias grhp='git reset HEAD --patch'
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
alias gdc='git diff --cached'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --patch"
alias gld='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s" --date=short'
alias glt='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s"'
alias git-delete-working-branches="git branch | grep -v '.*develop\|.*master\|.*main' | xargs git branch -D"
alias git-purge="git checkout develop; git reset --hard HEAD develop; git clean -dfx; git pull"
alias git-reset-repo="git-purge; git-delete-working-branches"

# NPM
alias nrs='npm run start'
alias nrb='npm run build'
alias nrt='npm run test'
alias nrth='npm run test-headless'
alias nrl='npm run lint'
alias nre='npm run e2e'
alias acid-test-gyp='curl -sL https://github.com/nodejs/node-gyp/raw/master/macOS_Catalina_acid_test.sh | bash'

# Gradle
alias grd='./gradlew'
alias grdcb='./gradlew clean build'
alias grdcbp='./gradlew clean build publishToMavenLocal'
alias grdcbr='./gradlew clean bootrun'
alias grdbr='./gradlew bootrun'
alias grdns='./gradlew npmStart'

# Docker
alias d='docker'
alias docker-stop-all='docker stop (docker ps -q)'

[ -f /home/linuxbrew/.linuxbrew/share/autojump/autojump.fish ]; and source /home/linuxbrew/.linuxbrew/share/autojump/autojump.fish

zoxide init fish | source
starship init fish | source
