# Basic Computer Setup

## Browser

- [ ] Install Firefox
- [ ] Sign into Dashlane
- [ ] Sign into Mozilla
- [ ] Sign into Google

## Neovim

- [ ] Install Neovim
- [ ] If on Linux, install xclip (Neovim clipboard)

## Git
- [ ] Generate a new Personal Access Token
- [ ] Configure git (git config --global user.name, user.email, credential helper etc)

## Shell
- [ ] Install zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
    - [ ] Install powerlevel10k `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
    - [ ] Install zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
    - [ ] Install zsh-syntax-highlighting: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

## Languages, package managers, etc.

- Install Python
    - [ ] Make python be python3 `sudo apt install python-is-python3` or just `alias python=python3`
- Install Go (download tar from web and run installer), add to path
- Install Rust `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Install npm and update node version

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
