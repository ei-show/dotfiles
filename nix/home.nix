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
    tmux
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
}