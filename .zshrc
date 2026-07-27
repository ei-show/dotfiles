### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bl32845/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

. "$HOME/.local/bin/env"

# zsh/*.zsh を読み込む
for file in "$HOME/.config/zsh/"*.zsh; do
  [ -r "$file" ] && source "$file"
done

# zsh/functions/*.zsh を読み込む
for file in "$HOME/.config/zsh/functions/"*.zsh; do
  [ -r "$file" ] && source "$file"
done

# sheldon
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"

# zsh 自動補完
autoload -Uz compinit
compinit

# コマンド履歴検索
source <(fzf --zsh)
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
