#!/bin/sh

# cd to home directory, just in case

cd ~

# Install Homebrew so that you can use 

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add appropriate version of brew to PATH
if test ! "$(uname)" = "Darwin"
then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /home/sean/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv shellenv)"
else
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/sean/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install packages

echo "Installing packages"
brew install git glow nvim ripgrep spotify tree zsh
brew install --cask kitty

# Install Firefox (only available on macOS Homebrew)
if test ! "$(uname)" = "Darwin"
  then
fi

# Install dotfiles

echo "Installing dotfiles"
git clone https://github.com/seanbanko/dotfiles && dotfiles/install

# Install oh-my-zsh

echo "Installing oh-my-zsh"
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

# Re-add Homebrew to PATH because it probably got removed
if test ! "$(uname)" = "Darwin"
then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /home/sean/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv shellenv)"
else
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/sean/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
