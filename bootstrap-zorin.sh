#!/bin/sh

# Don't abort the script if a command fails
set +e

# cd to home directory, just in case
cd ~

# Unix CLI Tools
apt install -y curl fzf git ripgrep tree vim wget xclip 
snap install glow

# Software 
apt install -y firefox git zsh

# Kitty (the apt version is outdated)
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

# Neovim  (build from source because the apt version is outdated)
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
# Ubuntu's 2019 TexLive is broken. If you have problems
# - Remove it `sudo apt remove `^texlive.*`
# - Follow the instructions here to do a fresh installation https://tug.org/texlive/quickinstall.html
# apt install -y latexmk texlive

# Config files
~/dotfiles/install

# Keyboard Remaps with Kinto
wget -qO- https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh || curl -fsSL https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh

# Change shell to zsh
chsh -s $(which zsh)
