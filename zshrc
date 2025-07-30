# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="tom_sc"

plugins=(
  git 
  aws 
  zsh-autosuggestions
  kube-ps1
  kubectl
)

SHOW_AWS_PROMPT=false

source $ZSH/oh-my-zsh.sh

# shortcuts
bindkey "^[[1;3D" backward-word # ALT-left-arrow  ⌥ + ←
bindkey "^[[1;3C" forward-word  # ALT-right-arrow ⌥ + →

alias proj="cd ~/Projects"

# ssh
eval $(ssh-agent)

# kubectl
source <(kubectl completion zsh)
alias k="kubectl"

# dotnet
export PATH="/usr/local/share/dotnet/dotnet:$PATH"
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"

# Added by dbt installer
export PATH="$PATH:/Users/tomsc/.local/bin"

# dbt aliases
alias dbtf=/Users/tomsc/.local/bin/dbt
