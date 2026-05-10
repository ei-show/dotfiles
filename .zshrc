### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bl32845/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

. "$HOME/.local/bin/env"

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

# zsh/*.zsh を読み込む
for file in "$HOME/.config/zsh/"*.zsh; do
  [ -r "$file" ] && source "$file"
done

# zsh/functions/*.zsh を読み込む
for file in "$HOME/.config/zsh/functions/"*.zsh; do
  [ -r "$file" ] && source "$file"
done
