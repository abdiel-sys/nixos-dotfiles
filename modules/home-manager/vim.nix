{ config, pkgs, lib, ...}:

{
  # Install Vim and dependencies
  home.packages = with pkgs; [
    # Tools required for Telescope
    ripgrep
    fd
    fzf
    # Language Servers
  ];

}
