#!/usr/bin/env bash
set -euo pipefail

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

defaults write -globalDomain NSUserKeyEquivalents -dict-add "Minimize" "@^\\U2193";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move Window to Left Side of Screen" "@^\\U2190";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move Window to Right Side of Screen" "@^\\U2192";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move to Built-in Retina Display" "@$\\U2190";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move to HS156KC" "@$\\U2192";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Zoom" "@^\\U2191";
