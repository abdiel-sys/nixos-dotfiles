{
  programs.nvf.settings.vim = {
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      setupOpts = {
        signature.enabled = true;
        cmdline = {
          keymap = {
            preset = "inherit";
          };
          completion.menu.auto_show = false;
        };
      };
    };

    autopairs.nvim-autopairs = {
      enable = true;
    };
  };
}
