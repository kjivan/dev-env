#!/usr/bin/env bash
set -e

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install fish
sudo bash -c 'echo /usr/local/bin/fish > /etc/shells'
chsh -s /usr/local/bin/fish
