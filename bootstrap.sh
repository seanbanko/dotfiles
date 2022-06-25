#!/bin/sh

# cd to home directory, just in case

cd ~

# Install Homebrew so that you can use 

echo "Installing Homebrew"
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Install packages

echo "Installing packages"
sudo apt update && sudo apt upgrade
brew install firefox git kitty nvim spotify zsh

# Install dotfiles

echo "Installing dotfiles"
git clone https://github.com/seanbanko/dotfiles && dotfiles/install

# Install oh-my-zsh

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

# GCM Core

echo "Installing GCM Core"
curl -sSL https://packages.microsoft.com/config/ubuntu/21.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft-prod.list
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo apt-get update
sudo apt-get install gcmcore
git-credential-manager-core configure
