{
  programs.nvf.settings.vim = {
    mini.files = {
      enable = true;

      setupOpts = {
        mappings = {
          go_out = "<BS>";
          go_in = "<CR>";
        };
        windows.preview = true;
      };
    };
    telescope.enable = true;
  };
}
