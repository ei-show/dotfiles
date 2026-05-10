function ghq-fzf() {
  local dir
  dir=$(ghq list | fzf)

  if [ -n "$dir" ]; then
    cd "$(ghq root)/$dir"
  fi
}

zle -N ghq-fzf
bindkey '^f' ghq-fzf