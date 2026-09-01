{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ./gruvbox-hair-blowing.png;
    polarity = "dark";

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 22;
    };
    fonts = {
      sizes = {
        terminal = 14;
        desktop = 12;
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
    opacity = {
      terminal = 0.95;
      applications = 0.95;
      desktop = 0.95;
      popups = 0.95;
    };
    targets = {
      nvf = {
        enable = true;
        transparentBackground = true;
      };
    };
  };
}
