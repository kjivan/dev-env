FILE=".local.zshrc"
if [ -f ".local.zshrc" ]; then
	source .local.zshrc
fi

if command -v fish &> /dev/null; then
	fish
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
