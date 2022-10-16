#!/bin/sh

# Don't abort the script if a command fails
set +e

# cd to home directory, just in case
cd ~

# Install packages
echo "Installing packages"
sudo apt install firefox git kitty vim ripgrep tree zsh kitty

# Install dotfiles
echo "Installing dotfiles"
sudo dotfiles/install

# Set up keyboard layout
echo "Installing keyboard layout file"
sudo cp -f ~/dotfiles/zorinos-kbd-layout /usr/share/X11/xkb/symbols/pc

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sudo /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Change shell to zsh
chsh -s $(which zsh)

