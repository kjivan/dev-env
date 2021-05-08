[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt auto_menu
setopt always_to_end
setopt complete_in_word
setopt flow_control
setopt menu_complete
zstyle ':completion:*:*:*:*:*' menu selectzstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'zstyle ':completion::complete:*' use-cache 1zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIRzstyle ':completion:*' list-colors ''zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
bindkey -e

autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit;
else
  compinit -C;
fi;

export ZSH_CACHE_DIR=.zcache/
source ~/.zsh_plugins.sh
alias update-plugins="antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh"

[ -d /usr/local/sbin ] && export PATH="/usr/local/sbin:$PATH"
[ -d /home/linuxbrew/.linuxbrew/bin ] && export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
[ -d /home/linuxbrew/.linuxbrew/sbin ] && export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
[ -d $HOME/go/bin ] && export PATH="$PATH:$HOME/go/bin" && export "GOPATH:$HOME/go"
[ -d $HOME/.cargo/bin ] && export PATH="$PATH:$HOME/.cargo/bin"
[ -d $HOME/.poetry/bin ] && export PATH="$PATH:$HOME/.poetry/bin"
[ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"

export VISUAL=nvim
export EDITOR $VISUAL
export GIT_EDITOR $VISUAL

alias dg="git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME"

alias reload="source $HOME/.zshrc"
alias edit="vi $HOME/.zshrc"

if type "sk">/dev/null; then
  export SKIM_DEFAULT_OPTIONS='--ansi --color="fg:#458588,bg:#1d2021,hl:#98971a,fg+:#458588,hl+:#cc241d,info:#b16286"'
  alias -g fzf='sk'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type "fd">/dev/null; then
  alias fdh='fd --hidden'
  alias fda='fdh --no-ignore'

  if type "sk">/dev/null; then
    export SKIM_DEFAULT_COMMAND="fd"

    alias c='cd (fd --type d | sk)'
    alias ch='cd (fd --type d --search-path $HOME | sk)'
    alias v='vi (fd | sk)'
    alias vh='vi (fd --search-path $HOME | sk)'
    alias ska='fda | sk'
  fi
fi

alias grep='command grep --color=auto'
if type "rg">/dev/null; then
  alias rgh='rg --hidden'
  alias rga='rgh --no-ignore'
  if type "sk">/dev/null; then
    alias rgs="sk --ansi -i -c 'rg --color=always --line-number \"{}\"'"
  fi
fi

if type "nvim">/dev/null; then
  alias vim=nvim
  alias vi=nvim
fi

if type "exa">/dev/null; then
  alias ls='exa --grid  --color auto --sort type'
  alias la='exa --grid  --color auto --all --sort type'
  alias ll='exa --long --color auto --sort type'
  alias lla='exa --long  --color auto --all --sort type'
  alias lt='exa --tree'
fi


if type "bat">/dev/null; then
  alias cat='bat -p'
  alias b='bat -p'
fi

if type "ccze">/dev/null; then
  ca(){
    cat "$@" | ccze -A
  }
  t(){
    tail "$@" | ccze -A
  }
  tf() {
    tail -f "$@" | ccze -A
  }
fi

if type "colordiff">/dev/null; then
    alias diff='colordiff --ignore-space-change'
else
    alias diff='diff --color --ignore-space-change'
fi


if type "autossh">/dev/null; then
    ssh(){
      command autossh -M 0 "$@"
    }
fi

create-min-snow(){
   yarn create snowpack-app "$@" --template @snowpack/app-template-minimal --use-yarn
}

alias serve-http='python -m SimpleHTTPServer 8000'
alias serve-http3='python3 -m http.server 8000 --bind 127.0.0.1'

# Network Debugging
get-port-app(){
  command lsof -nP -iTCP:"$@" | grep LISTEN
}

# Git
alias g='git'
alias gs='git status --short --branch'
alias gst='git stash'
alias gf='git fetch'
alias gco='git checkout'
alias gcop='git checkout --patch'
alias gr='git reset'
alias grh='git reset HEAD'
alias grhrd='git reset --hard'
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
alias gbl='git blame'
alias gpl='git pull'
alias gup='git stash; git pull; git stash pop'
alias gps='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias gt='git tag --sort="-taggerdate"'
alias gt1='gt | head -n 1'
alias gl="git log --pretty=format:'%Cred%h%Creset %s -%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glp="git log --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --patch"
alias gg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glf="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glpf="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --patch"
alias glfm="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --no-merges"
alias glpfm="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --patch --no-merges"
alias gld='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s" --date=short'
alias glt='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s"'

alias git-delete-working-branches="git branch | grep -v '.*develop\|.*master\|.*main' | xargs git branch -D"
alias git-purge="git checkout develop; git reset --hard HEAD develop; git clean -dfx; git pull"
alias git-reset-repo="git-purge; git-delete-working-branches"

# Git Hub
alias ghprl='gh pr list'
alias ghprco='gh pr checkout'

# AWS
alias a='aws'
alias ak='aws --region us-east-1  --profile kj'

# Kubectl
alias k='kubectl'

alias ka='kubectl apply'
alias kaf='kubectl apply -f'

alias kar='kubectl api-resources'

alias kd='kubectl describe'
alias kl='kubectl logs'
alias kdbg='kubectl debug'

alias kccc='kubectl config current-context'
alias kcgc='kubectl config get-contexts'
alias kcgcl='kubectl config get-clusters'
alias kcuc='kubectl config use-context'

alias kgc='kubectl get configmaps'
alias kgcj='kubectl get configmaps -o=json'
alias kgcy='kubectl get configmaps -o=yaml'
alias kec='kubectl edit configmaps'

alias kgd='kubectl get deployments'
alias kgdj='kubectl get deployments -o=json'
alias kgdy='kubectl get deployments -o=yaml'
alias ked='kubectl edit deployments'

alias kgp='kubectl get pods'
alias kgpj='kubectl get pods -o=json'
alias kgpy='kubectl get pods -o=yaml'
alias kep='kubectl edit pods'

alias kgr='kubectl get routes'
alias kgrj='kubectl get routes -o=json'
alias kgry='kubectl get routes -o=yaml'
alias ker='kubectl edit routes'

alias kgs='kubectl get secrets'
alias kgsj='kubectl get secrets -o=json'
alias kgsy='kubectl get secrets -o=yaml'
alias kes='kubectl edit secrets'

alias kgsvc='kubectl get services'
alias kgsvcj='kubectl get services -o=json'
alias kgsvcy='kubectl get services -o=yaml'
alias kesvc='kubectl edit services'

alias ks='kubectl scale deployments'

alias kroh='kubectl rollout history deployments'
alias kror='kubectl rollout restart deployments'
alias kros='kubectl rollout status deployments'
alias krou='kubectl rollout undo deployments'

# kustomize
alias ku='kubectl kustomize'
alias kua='kubectl apply -k'
alias kug='kubectl get -k'
alias kud='kubectl describe -k'

kgts(){
  kubectl get secret $1 -o json |\
  jq --raw-output ". | .data.\"$2\"" |\
  base64 -D > $2
  echo "Created $2"
}

kpts(){
  kubectl patch secret $1 \
  --type=json \
  -p="[{"op": "replace", "path": "/data/$2", "value": "\"(base64 $2)\""}]"
}

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

if test -f $HOME/.local.zshrc; then
     source $HOME/.local.zshrc
fi

if type "wemux">/dev/null; then
  if [ -z "$TMUX" ]; then
    wemux
  fi
else
  if [ -z "$TMUX" ]; then
    if tmux ls &>/dev/null; then
      tmux attach
    else
      tmux
    fi
  fi
fi


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
