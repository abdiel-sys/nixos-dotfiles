{
  config,
  pkgs,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    waybar = "waybar";
    quickshell = "quickshell";
    hypr = "hypr";
  };
in {
  imports = [
    # ../../modules/home-manager/hyprland/hyprlock.nix
    ../../modules/home-manager/wofi.nix
    ../../modules/home-manager/vim.nix
    ../../modules/home-manager/nvf.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/cliphist.nix
    ../../modules/home-manager/zsh.nix
  ];

  xdg.configFile =
    builtins.mapAttrs (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
  home.username = "bold";
  home.homeDirectory = "/home/bold";
  home.stateVersion = "26.05";

  home.sessionVariables = {
    EDITOR = "vim";
    FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow";
  };
  programs.wlogout.enable = true;
  programs.foot = {
    enable = true;
  };
  programs.btop = {
    enable = true;
    package = pkgs.btop-cuda;
  };

  home.packages = with pkgs; [
    obs-studio
    librewolf
    keepassxc
    pear-desktop
    kdePackages.dolphin
    kdePackages.okular
    quickshell
    fastfetch
    nwg-displays
    teams-for-linux
    libreoffice-stable
    onlyoffice-desktopeditors
    imv
    hunspell
    hunspellDicts.es_MX
    hyphenDicts.en_GB
    hyphenDicts.es_MX
    hyphenDicts.es_ES
    imagemagick
    (pkgs.writeShellApplication
      {
        name = "ns";
        runtimeInputs = with pkgs; [
          fzf
          nix-search-tv
        ];
        text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
      })
  ];
  services.kdeconnect.enable = true;
  programs.wofi.enable = true;
}
