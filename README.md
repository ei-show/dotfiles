# dotfiles
dotfiles

## Management by Nix

- CLI Tools

## Setup

### Required

- [Nix](https://nixos.org/download/)
- [Homebrew](https://brew.sh/)
- [ghq](https://github.com/x-motemen/ghq)

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
