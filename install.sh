#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sfn "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
ln -sfn "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
ln -sfn "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

echo "dotfiles linked."