#!/usr/bin/env fish
brew install \
starship \
tmux \
neovim \
ripgrep \
semgrep \
TankerHQ/homebrew-repo/ruplacer \
muesli/homebrew-tap/duf \
ncdu \
zoxide \
fd \
sk \
tldr \
exa \
colordiff \
git-delta \
bat \
direnv \
htop \
bottom \
watchexec \
ccze \
svn \
git \
git-flow \
httpie \
mdv \
gh \
golang \
jq \
python3 \
pdm \
node \
yarn \
exercism \
autossh \
scc \
lastpass-cli
divider

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup component add rls rust-analysis rust-src
divider

[ ! -d $HOME/.tmux/plugins ] && mkdir -p $HOME/.tmux/plugins

# file watching configs
if test ! -e /etc/sysctl.conf
    sudo touch /etc/sysctl.conf
end

if test ! (grep kern.maxfiles=10485760 /etc/sysctl.conf)
    sudo sysctl -w kern.maxfiles=10485760
    sudo fish -c 'echo kern.maxfiles=10485760 >> /etc/sysctl.conf'
end
if test ! (grep kern.maxfilesperproc=1048576 /etc/sysctl.conf)
    sudo sysctl -w kern.maxfilesperproc=1048576
    sudo fish -c 'echo kern.maxfilesperproc=1048576 >> /etc/sysctl.conf'
end
divider

brew install --cask \
google-chrome \
brave-browser \
spectacle \
alacritty \
docker \
slack \
discord \
signal \
dash \
insomnia \
simplenote \
notion \
spotify
divider

# fonts
brew tap \
homebrew/cask-fonts
brew install --cask \
font-sauce-code-pro-nerd-font
divider

pip3 install --upgrade \
pip \
setuptools \
wheel
divider

pip3 install \
neovim \
pylint \
flake8
divider

yarn global add --ignore-engines \
typescript \
eslint \
eslint-config-prettier \
eslint-plugin-prettier \
stylelint \
stylelint-config-recommended \
prettier \
@vue/cli \
@vue/cli-init \
@angular/cli \
expo-cli
divider
