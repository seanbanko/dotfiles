#!/bin/sh

# Don't abort the script if a command fails
set +e

# cd to home directory, just in case
cd ~

# Unix CLI Tools
apt install -y curl fzf git ripgrep tree vim wget xclip 
snap install glow

# Software 
apt install -y firefox git kitty zsh

# Neovim 
apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
make CMAKE_BUILD_TYPE=Release
make install

# Oh-my-zsh
echo "Installing oh-my-zsh"
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Latex
apt install -y latexmk texlive

# Config files
~/dotfiles/install

# Keyboard Remaps with Kinto
wget -qO- https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh || curl -fsSL https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh

# Change shell to zsh
chsh -s $(which zsh)
