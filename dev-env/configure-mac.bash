#!/usr/bin/env bash
set -euo pipefail

defaults write -globalDomain NSUserKeyEquivalents -dict-add "Minimize" "@^\\U2193";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move Window to Left Side of Screen" "@^\\U2190";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move Window to Right Side of Screen" "@^\\U2192";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move to Built-in Retina Display" "@~\\U2193";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move to LG Ultra HD" "@~\\U2191";
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Zoom" "@^\\U2191";
defaults write -g AppleFontSmoothing -int 0
