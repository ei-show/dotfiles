{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    git
    fzf
    ripgrep
    fd
    eza
    bat
    jq
    yq
    zoxide
    starship
    lazygit
    neovim
    nodejs
    tmux
    iterm2
    gh
  ];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = false;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  targets.darwin.defaults."com.googlecode.iterm2" = {
    PrefsCustomFolder = "${config.home.homeDirectory}/.config/iterm2";
    LoadPrefsFromCustomFolder = true;
  };
}
