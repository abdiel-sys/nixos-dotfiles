{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    plugins = with pkgs.yaziPlugins; {
      kdeconnect-send.package = kdeconnect-send;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          run = "plugin kdeconnect-send";
          on = ["<C-s>"];
          desc = "Send selected files via KDE Connect";
        }
      ];
    };
  };
}
