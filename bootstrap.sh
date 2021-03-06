#!/bin/sh

# Don't abort the script if a command fails
set -e

# cd to home directory, just in case
cd ~

# Install or update Homebrew
if [ ! command -v brew &> /dev/null]; then
  echo 'Installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /home/sean/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo 'Updating homebrew'
  brew update
fi

# Do macOS only things
if test "$(uname)" = "Darwin"
then
    brew install --cask firefox
    brew install --cask kitty
    brew install --cask spotify
else
    echo "/home/linuxbrew/.linuxbrew/bin/zsh" | sudo tee -a /etc/shells
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/sean/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    sudo apt install firefox kitty
fi

# Install packages
echo "Installing packages"
brew install git glow nvim ripgrep tree zsh

# Install dotfiles
echo "Installing dotfiles"
dotfiles/install

# Install oh-my-zsh
echo "Installing oh-my-zsh"
ZSH = /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

# Re-add Homebrew to PATH because it probably got removed
if test "$(uname)" = "Darwin"
then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /home/sean/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "/home/linuxbrew/.linuxbrew/bin/brew" | sudo tee -a /etc/shells
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/sean/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
