if command -v fish &> /dev/null; then
	fish
fi

if [ -f ".local.zshrc" ]; then
	source .local.zshrc
fi
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

alias reload-zsh="source ~/.zshrc"
alias dg="git --git-dir=$HOME/.dev-env.git/ --work-tree=$HOME $argv"

alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
