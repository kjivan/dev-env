if command -v fish &> /dev/null; then
	fish
fi

[ -f ".local.zsh" ] && source .local.zsh

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

alias dg="git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME $argv"

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="vi ~/.zshrc"

alias divider="echo --------------------------------------------------------------------------------"
alias notify-done="osascript -e 'display notification \"Task Completed\" with title \"Done\"'; end"
alias grep="command grep --color=auto $argv"

alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

alias edit-vscode-settings='vi $HOME/Library/Application\ Support/Code/User/settings.json'

[ -f "$HOME/.zsh/aws.zsh" ] && source $HOME/.zsh/aws.zsh
[ -f "$HOME/.zsh/docker.zsh" ] && source $HOME/.zsh/docker.zsh
[ -f "$HOME/.zsh/gh.zsh" ] && source $HOME/.zsh/gh.zsh
[ -f "$HOME/.zsh/git.zsh" ] && source $HOME/.zsh/git.zsh
[ -f "$HOME/.zsh/gradle.zsh" ] && source $HOME/.zsh/gradle.zsh
[ -f "$HOME/.zsh/keytool.zsh" ] && source $HOME/.zsh/keytool.zsh
[ -f "$HOME/.zsh/kubectl.zsh" ] && source $HOME/.zsh/kubectl.zsh
[ -f "$HOME/.zsh/npm.zsh" ] && source $HOME/.zsh/npm.zsh
[ -f "$HOME/.zsh/openssl.zsh" ] && source $HOME/.zsh/openssl.zsh

# Completions
#[ -f "$HOME/.zsh/git-completion.zsh" ] && source $HOME/.zsh/git-completion.zsh
