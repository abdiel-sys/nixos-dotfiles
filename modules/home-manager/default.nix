{pkgs, ...}: {
  imports = [
    ./git.nix
    ./zsh.nix
    ./hyprland
    ./nvf
    ./terminals
    ./programs
  ];
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    zoxide
  ];
}
