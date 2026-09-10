{
  programs.nvf.settings.vim = {
    tabline.nvimBufferline = {
      enable = true;
      mappings = {
        closeCurrent = "<leader>bx";
      };
      setupOpts = {
        options = {
          separator_style = "padded_slant";
        };
      };
    };
  };
}
