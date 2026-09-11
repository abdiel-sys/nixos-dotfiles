{pkgs, ...}: {
  imports = [
    ./git.nix
    ./zsh.nix
    ./hyprland
    ./terminals
    ./programs
    ./nvf
  ];
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    zoxide
  ];
}
