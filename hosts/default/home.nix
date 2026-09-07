{
  inputs,
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
    inputs.nvf.homeManagerModules.default
    ../../modules/home-manager
  ];

  xdg.configFile =
    builtins.mapAttrs (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
  home = {
    username = "bold";
    homeDirectory = "/home/bold";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
      FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow";
    };
  };

  home.packages = with pkgs; [
    obs-studio
    librewolf
    keepassxc
    pear-desktop
    quickshell
    fastfetch
    nwg-displays
    teams-for-linux
    imv
    rclone
    imagemagick
    poppler-utils
    unzip
    _7zz
    gnutar
    bzip2
    xz
    zip
    gzip
    lha
    lz4
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
}
