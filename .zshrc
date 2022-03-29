FILE=".local.zshrc"
if [ -f ".local.zshrc" ]; then
	source .local.zshrc
fi

if command -v fish &> /dev/null; then
	fish
fi
