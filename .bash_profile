if [ -f ~/.local.bashrc ]; then
   source ~/.local.bashrc
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

source /Users/Kavi.Jivan/.docker/init-bash.sh || true # Added by Docker Desktop

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kjivan/.cache/lm-studio/bin"
# End of LM Studio CLI section

# Added by Antigravity CLI installer
export PATH="/Users/kjivan/.local/bin:$PATH"

# Rust Cargo
. "$HOME/.cargo/env"
