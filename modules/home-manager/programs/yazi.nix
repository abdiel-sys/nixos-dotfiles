{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    extraPackages = [
      pkgs.ouch
    ];
    plugins = with pkgs.yaziPlugins; {
      kdeconnect-send.package = kdeconnect-send;
      ouch.package = ouch;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          run = "plugin kdeconnect-send";
          on = ["<C-s>"];
          desc = "Send selected files via KDE Connect";
        }
        {
          run = "plugin ouch";
          on = ["c" "a"];
          desc = "Compress with ouch";
        }
      ];
    };
  };
}
