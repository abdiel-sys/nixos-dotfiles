{
  programs.nvf.settings.vim = {
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      setupOpts = {
        signature.enabled = true;
        cmdline = {
          keymap.preset = "cmdline";
          completion.menu.auto_show = true;
        };
      };
    };

    autopairs.nvim-autopairs = {
      enable = true;
    };
  };
}
