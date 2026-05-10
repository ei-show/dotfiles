### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bl32845/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

. "$HOME/.local/bin/env"

# Aliases
alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ll -A"
alias g=git
alias k=kubectl
alias kc=kubecolor
alias kx=kubectx
alias t=terraform
command -v nvim &>/dev/null && alias vim=nvim

# terraform
export TF_CLI_ARGS_plan="-parallelism=50"
export TF_CLI_ARGS_apply="-parallelism=50"
export TF_CLI_ARGS_destroy="-parallelism=50"
export TF_CLI_ARGS_refresh="-parallelism=50"

# kubernetes
export PATH="$HOME/.krew/bin:$PATH"
export KUBECTL_EXTERNAL_DIFF="colordiff -u"

# sheldon
eval "$(sheldon source)"
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
