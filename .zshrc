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
