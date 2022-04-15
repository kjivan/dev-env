#!/usr/bin/env bash
set -euo pipefail

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool true

# Set a blazingly fast keyboard repeat rate
# 1 => 15ms
# 10 => 150ms
# https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Setup window navigation shortcuts
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Minimize" "@^\\U2193";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move Window to Left Side of Screen" "@^\\U2190";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move Window to Right Side of Screen" "@^\\U2192";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move to Built-in Retina Display" "@~\\U2190";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move to HS156KC" "@~\\U2192";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Zoom" "@^\\U2191";
