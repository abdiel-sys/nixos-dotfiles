{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  imports = [
    ../../modules/nixos/nvidia.nix
    ../../modules/stylix/stylix.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;

  time.timeZone = "America/Mexico_City";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;

  services.libinput.enable = true;

  services.getty.autologinUser = "bold";

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.zsh.enable = true;
  users.users.bold = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  environment.systemPackages = with pkgs; [
    wget
    kitty
    vim
    alejandra
    qt6.qtdeclarative

    waybar
    hyprpaper
    brightnessctl
    playerctl
    pavucontrol
    hypridle
    hyprlock
  ];
  services.power-profiles-daemon.enable = true;
  programs.ssh.startAgent = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "bold";
    group = "users";
    dataDir = "/home/bold/sync";
    configDir = "/home/bold/.config/syncthing";
  };
  programs.steam = {
    enable = true; # Master switch, already covered in installation
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting
    # Other general flags if available can be set here.
  };
  system.stateVersion = "26.05";
}
