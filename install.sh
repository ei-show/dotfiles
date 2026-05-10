#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

backup_if_exists() {
  local target="$1"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "${target}.backup.$(date +%Y%m%d%H%M%S)"
    echo "backup: $target"
  fi
}

link_file() {
  local src="$1"
  local dest="$2"

  backup_if_exists "$dest"
  ln -sfn "$src" "$dest"
  echo "linked: $dest -> $src"
}

link_file "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
link_file "$DOTFILES_DIR/sheldon" "$HOME/.config/sheldon"
link_file "$DOTFILES_DIR/zsh" "$HOME/.config/zsh"
link_file "$DOTFILES_DIR/nix" "$HOME/.config/nix"

link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

echo "dotfiles linked."