#!/usr/bin/env fish

bind \co kill-line

[ -d /usr/local/sbin ] && set -g PATH "/usr/local/sbin" $PATH
[ -d /opt/homebrew/bin ] && set -g PATH "/opt/homebrew/bin" $PATH
[ -d $HOME/go ] && set -gx GOPATH $HOME/go
[ -d $HOME/.cargo/bin ] && set -gx PATH $PATH $HOME/.cargo/bin
[ -d $HOME/.poetry/bin ] && set -gx PATH $PATH $HOME/.poetry/bin
[ -d $HOME/bin ] && set -gx PATH $PATH $HOME/bin
[ -d $HOME/opt/anaconda3/bin ] && set -gx PATH $PATH $HOME/opt/anaconda3/bin

set -gx fish_greeting ""

set -gx VISUAL nvim
set -gx EDITOR $VISUAL
set -gx GIT_EDITOR $VISUAL

function dg -w "git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME"; git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME $argv; end

function benchmark-shell; for i in (seq 1 10); /usr/bin/time fish -i -c exit; end; end
function reload -w "source $HOME/.config/fish/config.fish"; source $HOME/.config/fish/config.fish $argv; end
function edit-fish -w "vi $HOME/.config/fish/config.fish"; vi $HOME/.config/fish/config.fish $argv; end
function edit-alacritty -w "vi $HOME/.config/alacritty/alacritty.yml"; vi $HOME/.config/alacritty/alacritty.yml $argv; end

function divider; echo --------------------------------------------------------------------------------; end
function notify-done; osascript -e 'display notification "Task Completed" with title "Done"'; end

if type -q sk
  set -gx SKIM_DEFAULT_OPTIONS '--ansi --color="fg:#458588,bg:#1d2021,hl:#98971a,fg+:#458588,hl+:#cc241d,info:#b16286"'
  function fzf -w "sk"; sk $argv; end
end

if type -q fd
    function fdh -w "fd --hidden"; fd --hidden $argv; end
    function fda -w "fdh --no-ignore"; fdh --no-ignore $argv; end

    if type -q sk
        set -gx SKIM_DEFAULT_COMMAND "fd"

        function ch -w "cd (fd --type d --search-path $HOME | sk)"; cd (fd --type d --search-path $HOME | sk) $argv; end
        function vh -w "vi (fd --search-path $HOME | sk)"; vi (fd --search-path $HOME | sk) $argv; end
        function ska -w "fda | sk"; fda | sk $argv; end
    end
end

function grep -w "command grep --color=auto"; command grep --color=auto $argv; end
if type -q rg
    function rgh -w "rg --hidden"; rg --hidden $argv; end
    function rga -w "rgh --no-ignore"; rgh --no-ignore $argv; end
end

if type -q nvim
    function vim -w 'nvim'; nvim $argv; end
    function vi -w 'nvim'; nvim $argv; end
end

if type -q exa
    function ls -w "exa --grid  --color auto --sort type"; exa --grid  --color auto --sort type $argv; end
    function lsa -w "exa --grid  --color auto --all --sort type"; exa --grid  --color auto --all --sort type $argv; end
    function ll -w "exa --long --color auto --sort type"; exa --long --color auto --sort type $argv; end
    function lla -w "exa --long  --color auto --all --sort type"; exa --long  --color auto --all --sort type $argv; end
    function lt -w "exa --tree"; exa --tree $argv; end
end

if type -q bat
    function cat -w "bat -p"; bat -p $argv; end
    function b -w "bat -p"; bat -p $argv; end
end

if type -q ccze
    function ca; command cat $argv | ccze -A; end
    function t; command tail $argv | ccze -A; end
    function tf; command tail -f $argv | ccze -A; end
end

if type -q colordiff
    function diff -w "colordiff --ignore-space-change"; colordiff --ignore-space-change $argv; end
else
    function diff -w "diff --color --ignore-space-change"; diff --color --ignore-space-change $argv; end
end

if type -q watchexec
    function we -w 'watchexec'; watchexec $argv; end
    function wee -w 'watchexec -e'; watchexec -e $argv; end
    function wew -w 'watchexec -w'; watchexec -w $argv; end
    function wef -w 'watchexec -f'; watchexec -f $argv; end

    function bashwatch -w 'watchexec -e sh,bash'; watchexec -e "sh,bash" $argv; end
    function fishwatch -w 'watchexec -e fish'; watchexec -e "fish" $argv; end
    function pywatch -w 'watchexec -e py'; watchexec -e "py" $argv; end
    function jswatch -w 'watchexec -e js,ts'; watchexec -e "js,ts" $argv; end

    function javawatch -w 'watchexec -e java'; watchexec -e "java" $argv; end
    function cwatch -w 'watchexec -e c,cc,cpp,cxx,c++'; watchexec -e "c,cc,cpp,cxx,c++" $argv; end
    function rswatch -w 'watchexec -e rs'; watchexec -e "rs" $argv; end

    function grdwatch -w 'watchexec -e gradle'; watchexec -e "gradle" $argv; end
end

if type -q autossh
    function ssh; command autossh -M 0 $argv; end
end

function create-min-snow; yarn create snowpack-app $argv --template @snowpack/app-template-minimal --use-yarn; end

function serve-http -w "python -m SimpleHTTPServer 8000"; python -m SimpleHTTPServer 8000 $argv; end
function serve-http3 -w "python3 -m http.server 8000 --bind 127.0.0.1"; python3 -m http.server 8000 --bind 127.0.0.1 $argv; end
function get-port-app; lsof -nP -iTCP:$argv | grep LISTEN; end
function curl-file -w "curl -OLC"; curl -OLC - $argv; end

function edit-vscode-settings; vi $HOME/Library/Application\ Support/Code/User/settings.json; end

set -xg SPRING_OUTPUT_ANSI_ENABLED always

source $HOME/.config/fish/aws.fish
source $HOME/.config/fish/docker.fish
source $HOME/.config/fish/gh.fish
source $HOME/.config/fish/git.fish
source $HOME/.config/fish/gradle.fish
source $HOME/.config/fish/keytool.fish
source $HOME/.config/fish/kubectl.fish
source $HOME/.config/fish/npm.fish
source $HOME/.config/fish/openssl.fish
source $HOME/.config/fish/yarn.fish

[ -f $HOME/.local.fish ] && source $HOME/.local.fish

direnv hook fish | source
zoxide init fish | source
starship init fish | source

if [ -z "$TMUX" ]
  # regex checks for unattached tmux session
  if string match -q -r "\d{4}\)\$" (tmux ls 2>/dev/null)
    tmux attach
  else
    tmux
  end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#eval /Users/kavijivan/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

source /Users/Kavi.Jivan/.docker/init-fish.sh || true # Added by Docker Desktop
