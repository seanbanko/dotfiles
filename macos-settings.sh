#!/bin/sh

# Disable press-and-hold to enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Enable quitting Finder with cmd+q
defaults write com.apple.finder QuitMenuItem -bool true

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Set menu bar date and clock format
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
