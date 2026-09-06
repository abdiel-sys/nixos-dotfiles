{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.okular
  ];
  services.kdeconnect.enable = true;
}
