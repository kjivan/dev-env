if [ -f ~/.local.bashrc ]; then
   source ~/.local.bashrc
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
. "$HOME/.cargo/env"

source /Users/Kavi.Jivan/.docker/init-bash.sh || true # Added by Docker Desktop
