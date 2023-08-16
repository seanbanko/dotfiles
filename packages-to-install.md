# Computer Setup Guide

## Homebrew

Install [Homebrew](https://brew.sh/).

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)`

## Browser

Install software from your Brewfile (if you have one) `brew bundle install`.

Otherwise, continue.

## Neovim

- [ ] Install Neovim
- [ ] Copy ~/.config/nvim from dotfiles 

## Git

- [ ] Configure git (git config --global user.name, user.email, credential helper etc)
- [ ] Generate a new Personal Access Token on GitHub 

## Shell

- [ ] Install zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
    - [ ] Install powerlevel10k`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
    - [ ] Install zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions` 
    - [ ] Install zsh-syntax-highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` 

## Languages and Package Managers

- `brew install go`

## Command Line Tools

- [ ] Install command line stuff
    - curl
    - git
    - fzf
    - ripgrep
    - tree
    - wget
    - glow (snap)

## Fonts

- [ ] Install Fira Code
    Use `getnf` to install a nerd font (e.g. FiraCode NF)
    ```
    git clone https://github.com/ronniedroid/getnf.git
    cd getnf
    ./install.sh
    ./getnf
    ```
- [ ] Change system monospace font and Firefox monospace font to be one of the nerd fonts you installed
