{
  config,
  pkgs,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    waybar = "waybar";
    wofi = "wofi";
    quickshell = "quickshell";
    hypr = "hypr";
  };
in {
  imports = [
    ../../modules/home-manager/vim.nix
    ../../modules/home-manager/nvf.nix
    ../../modules/home-manager/git.nix
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
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    initContent = ''
      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[w' kill-region
    '';
    shellAliases = {
      btw = "echo i use hyprland btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
    };
    profileExtra = ''
      if uwsm check may-start; then
          exec uwsm start hyprland.desktop
      fi
    '';
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
    quickshell
    fastfetch
    wofi
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
}
