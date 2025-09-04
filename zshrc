export ZSH="$HOME/.oh-my-zsh"
plugins=(git github zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

alias ..="cd .."
alias ...="cd ../.."

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias gs="git switch"

alias kc="kubectl"
alias kx="kubectx"
alias kns="kubens"

export PATH=$PATH:$(go env GOPATH)/bin

source <(fzf --zsh)

eval "$(zoxide init zsh --cmd j)"

eval "$(direnv hook zsh)"

eval "$(starship init zsh)"
