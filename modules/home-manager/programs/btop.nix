{pkgs, ...}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop-cuda;
    settings = {
      vim_keys = true;
    };
  };
}
