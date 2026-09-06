{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice-stable
    onlyoffice-desktopeditors
    hunspell
    hunspellDicts.es_MX
    hyphenDicts.en_GB
    hyphenDicts.es_MX
    hyphenDicts.es_ES
  ];
}
