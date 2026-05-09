defaults write -g KeyRepeat -int 2
defaults write -g ApplePressAndHoldEnabled -bool false

defaults write com.apple.finder AppleShowAllFiles -bool true; killall Finder

mkdir -p ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots; killall SystemUIServer

brew bundle
