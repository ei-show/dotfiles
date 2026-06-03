# dotfiles
dotfiles

## Management by Nix

- CLI Tools

## Setup

### Required

- Nix
- Homebrew
- ghq

### Execute script

```sh
ghq get ei-show/dotfiles
cd $(ghq root)/ei-show/dotfiles
chmod +x install.sh
./install.sh
```

```sh
nix run ~/.config/nix#home-manager -- switch --impure --flake ~/.config/nix#"$USER"
```
