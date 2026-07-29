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
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/atuin" "$HOME/.config/atuin"

link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
link_file "$DOTFILES_DIR/iterm2/com.googlecode.iterm2.plist" "$HOME/.config/iterm2/com.googlecode.iterm2.plist"

mkdir -p "$HOME/.codex/docs"
link_file "$DOTFILES_DIR/codex/AGENTS.md" "$HOME/.codex/AGENTS.md"
link_file "$DOTFILES_DIR/codex/.env" "$HOME/.codex/.env"
link_file "$DOTFILES_DIR/codex/docs" "$HOME/.codex/docs"

echo "dotfiles linked."
