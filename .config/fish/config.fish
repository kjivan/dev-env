#!/usr/bin/env fish

bind \co kill-line
bind \cs runsudo

[ -d /usr/local/sbin ] && set -g PATH "/usr/local/sbin" $PATH
[ -d $HOME/go ] && set -gx GOPATH $HOME/go
[ -d $HOME/.cargo/bin ] && set -gx PATH $PATH $HOME/.cargo/bin
[ -d $HOME/.poetry/bin ] && set -gx PATH $PATH $HOME/.poetry/bin
[ -d $HOME/bin ] && set -gx PATH $PATH $HOME/bin

set -gx fish_greeting ""

set -gx VISUAL nvim
set -gx EDITOR $VISUAL
set -gx GIT_EDITOR $VISUAL

alias dg="git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME"

function benchmark-shell; for i in (seq 1 10); /usr/bin/time fish -i -c exit; end; end;
alias reload="source $HOME/.config/fish/config.fish"
alias edit="vi $HOME/.config/fish/config.fish"

if type -q sk
  set -gx SKIM_DEFAULT_OPTIONS '--ansi --color="fg:#458588,bg:#1d2021,hl:#98971a,fg+:#458588,hl+:#cc241d,info:#b16286"'
  alias fzf='sk'
end

if type -q fd
    alias fdh='fd --hidden'
    alias fda='fdh --no-ignore'

    if type -q sk
        set -gx SKIM_DEFAULT_COMMAND "fd"

        alias ch='cd (fd --type d --search-path $HOME | sk)'
        alias vh='vi (fd --search-path $HOME | sk)'
        alias ska='fda | sk'
    end
end

alias grep='command grep --color=auto'
if type -q rg
    alias rgh='rg --hidden'
    alias rga='rgh --no-ignore'
end

if type -q nvim
    alias vim=nvim
    alias vi=nvim
end

if type -q exa
    alias ls='exa --grid  --color auto --sort type'
    alias lsa='exa --grid  --color auto --all --sort type'
    alias ll='exa --long --color auto --sort type'
    alias lla='exa --long  --color auto --all --sort type'

    alias lt='exa --tree'
end

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

source $HOME/.config/fish/aws.fish
source $HOME/.config/fish/docker.fish
source $HOME/.config/fish/gh.fish
source $HOME/.config/fish/git.fish
source $HOME/.config/fish/gradle.fish
source $HOME/.config/fish/kubectl.fish
source $HOME/.config/fish/npm.fish

[ -f $HOME/.local.fish ] && source $HOME/.local.fish

direnv hook fish | source
zoxide init fish | source
starship init fish | source

if type -q wemux
  if [ -z "$TMUX" ]
    wemux
  end
else
  if [ -z "$TMUX" ]
    if tmux ls &>/dev/null
      tmux attach
    else
      tmux
    end
  end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#eval /Users/kjivan/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
